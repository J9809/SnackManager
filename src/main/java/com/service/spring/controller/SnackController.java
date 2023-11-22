package com.service.spring.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.service.spring.domain.*;
import com.service.spring.service.AdminService;
import com.service.spring.service.RankService;
import com.service.spring.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class SnackController {

    @Autowired
    private StudentService studentService;
    @Autowired
    private AdminService adminService;
    @Autowired
    private RankService rankService;

    @GetMapping("selectAllByAdmin.do")
    public String doSelectAllAdmin(Model model) {
        try {
            List<Snack> snacks = adminService.selectAll();
            System.out.println(snacks);
            model.addAttribute("snacks", snacks);
            model.addAttribute("title", "관리자 - 전체 재고 조회");
            return "adminInventory";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @GetMapping("selectAllByStudent.do")
    public String doSelectAllStudent(Model model) {
        System.out.println("✅ Select All Snack Controller");
        try {
            List<Snack> snacks = studentService.selectAll();
            System.out.println(snacks);
//            System.out.println("snacks size = " + snacks.size());
            model.addAttribute("snacks", snacks);
            model.addAttribute("title", "학생 - 전체 재고 조회");
            return "studentInventory";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @PostMapping( "student/fetchSnack.do")
    public String doFetchSnack(@RequestBody List<Snack> list, HttpSession session) {
        System.out.println("✅ Fetch Snack Controller");
        System.out.println(list);
        try {
            Member loginUser = (Member) session.getAttribute("loginUser");
            for (Snack s : list) {
                studentService.fetchSnack(s);
                History history = new History(loginUser.getMemberId(), s.getSnackId(), s.getQuantity());
                studentService.registerHistory(history);
            }
            return "index";
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("❗️ERROR");
        }
        return "index";
    }

    @GetMapping("voteSnack.do")
    public String doVoteSnackStudent(Model model, HttpSession session) {
        try {
            Member loginUser = (Member) session.getAttribute("loginUser");
            int res = studentService.voteCheck(loginUser);
            System.out.println("✅ vote check. res = " + res);
            if (res > 0) {
                return "redirect:http://localhost:9999/index.jsp";
            }
            List<Snack> snacks = studentService.selectAll();
            model.addAttribute("snacks", snacks);
            model.addAttribute("title", "학생 - 간식 투표");
            return "vote";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @PostMapping( "api/voteSnack.do")
    public String doVoteSnackPost(@RequestBody List<Snack> list, HttpSession session) {
        System.out.println("✅ Vote Post Snack Controller");
        System.out.println(list);
        System.out.println(session.getAttribute("loginUser"));
        Member loginUser = (Member) session.getAttribute("loginUser");
        try {
            for (Snack s : list) {
                studentService.voteSnack(new Vote(loginUser.getMemberId(), s.getSnackId()));
            }
            return "index";
        } catch (Exception e) {
            System.out.println("❗️ERROR");
        }
        return "index";
    }

    @GetMapping("getMemberRank.do")
    public String doGetMemberRank(Model model, HttpSession session) {
        try {
            List<MemberRank> memberRank = rankService.getMemberRank();
            
            ObjectMapper mapper = new ObjectMapper();
            String jsonMemberRank = mapper.writeValueAsString(memberRank);
            
            model.addAttribute("list", jsonMemberRank);
            model.addAttribute("title", "멤버 랭킹");
            return "rank_page";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @GetMapping("getSnackRank.do")
    public String doGetSnackRank(Model model, HttpSession session) {
        try {
            List<SnackRank> snackRank = rankService.getSnackRank();
            model.addAttribute("list", snackRank);
            model.addAttribute("title", "스낵 랭킹");
            return "snackRankTmp";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    @GetMapping("getMemberRankBySnack.do")
    @ResponseBody
    public List<MemberRank> doGetMemberRankBySnack(Model model, HttpSession session, @RequestParam String snackId) {
        try {
            System.out.println("✅ getMemberRankBySnack Controller - snackId = " + snackId);
            List<MemberRank> memberRankBySnack = rankService.getMemberRankBySnack(new Snack(Long.parseLong(snackId)));

            System.out.println(memberRankBySnack);
            model.addAttribute("memberRankList", memberRankBySnack);
            return memberRankBySnack;
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("❗️ not returned");
        return null;
    }

    @PostMapping("tempSnackUpdate.do")
    public String doUpdateSnack(Model model, HttpSession session) {
        try {
            final int snackDisplay = 100;
            final int otherDisplay = 50;
            List<Snack> snackList = NaverShopSearch.makeList(101, "snack", "과자", snackDisplay);
            snackList.addAll(NaverShopSearch.makeList(201, "snack", "과자", snackDisplay));
            snackList.addAll(NaverShopSearch.makeList(301, "snack", "과자", snackDisplay));
            snackList.addAll(NaverShopSearch.makeList(101, "jelly", "젤리", otherDisplay));
            snackList.addAll(NaverShopSearch.makeList(101, "coffee", "음료", otherDisplay));
            System.out.println("✅Snack Update. snackList.length = " + snackList.size());
            for (Snack s : snackList) {
                adminService.registerSnack(s);
            }
            return "index";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "index";
    }

    @GetMapping("/orderSnack.do")
    public String doOrderSnack(Model model, HttpSession session) {
        System.out.println("✅ Order Snack Controller");
        return "order";
    }

    public static int[] findSelectedItems(int[][] dp, int[][] A, int N, int K) {
        int[] selectedItems = new int[N + 1];
        int i = N;
        int k = K;

        while (i > 0 && k > 0) {
            if (dp[i][k] != dp[i - 1][k]) {
                selectedItems[i] += 1;
                k -= A[i][0];
            } else {
                i -= 1;
            }
        }

        return selectedItems;
    }

    @GetMapping("/knapsack.do")
    @ResponseBody
    public List<Snack> knapsack(Model model, HttpSession session, @RequestParam int budget) throws Exception {

        try {
            System.out.println("budget = " + budget);
            List<Snack> snacks = null;

            List<VoteWithSnackInfo> voteWithSnackInfos = adminService.viewVote();
            System.out.println(voteWithSnackInfos);

            int N = voteWithSnackInfos.size();
            int K = budget;
            int[][] A = new int[N + 1][2];
            for (int i = 1; i <= N; i++) {
                A[i][0] = voteWithSnackInfos.get(i - 1).getPrice();
                A[i][1] = voteWithSnackInfos.get(i - 1).getCount();
            }
            int[][] dp = new int[N + 1][K + 1];

            for (int i = 1; i <= N; i++) {
                for (int k = 1; k <= K; k++) {
                    if (k >= A[i][0]) {
                        dp[i][k] = Math.max(dp[i - 1][k], dp[i - 1][k - A[i][0]] + A[i][1]);
                    } else {
                        dp[i][k] = Math.max(dp[i][k], dp[i - 1][k]);
                    }
                }
            }

//            for (int i = 1; i <= N; i++) {
//                for (int j = 1; j <= K; j++) {
//                    System.out.print(dp[i][j] + " ");
//                }
//                System.out.println();
//            }
            int[] selectedItems = findSelectedItems(dp, A, N, K);
            System.out.print("Number of each item selected: ");
            for (int i = 1; i <= N; i++) {
                System.out.println(voteWithSnackInfos.get(i - 1).getSnackName() + ": " + selectedItems[i]);
            }
            return snacks;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

}
