Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDB7613067
	for <lists+dm-devel@lfdr.de>; Mon, 31 Oct 2022 07:38:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667198338;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=J/boQeFkcqLR9vi+at9vGUx/A9Zeqdy1qvbQrI7nfP8=;
	b=TOm+nIizK4zVGz6eVsLbbgMoub4lKMdz7yfY52thtlgmgmc+7o8OB0Aou/zJici/rMeyNf
	T1rBLPpilsCWy1iYogwhxYkLpck+jq6h4beqGmD6j3HWvl8ow2qtWqr/E+VkBgp4dXn2oe
	aMnGG3oN64jDmk2goGwMukup9cTtaUI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-133-6o9B8fsgMeag08jHH6O-cQ-1; Mon, 31 Oct 2022 02:38:56 -0400
X-MC-Unique: 6o9B8fsgMeag08jHH6O-cQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9A631833B14;
	Mon, 31 Oct 2022 06:38:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DCBF11410F38;
	Mon, 31 Oct 2022 06:38:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 647AB19465B6;
	Mon, 31 Oct 2022 06:38:43 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 548461946597
 for <dm-devel@listman.corp.redhat.com>; Wed, 26 Oct 2022 23:22:20 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3B2AA40C94AA; Wed, 26 Oct 2022 23:22:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3266340C6FA0
 for <dm-devel@redhat.com>; Wed, 26 Oct 2022 23:22:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D7933804072
 for <dm-devel@redhat.com>; Wed, 26 Oct 2022 23:22:20 +0000 (UTC)
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-a-_ZwUGqNoiuYJ_ecq-UIg-1; Wed, 26 Oct 2022 19:22:17 -0400
X-MC-Unique: a-_ZwUGqNoiuYJ_ecq-UIg-1
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29QMITxZ014921;
 Wed, 26 Oct 2022 23:20:06 GMT
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kfb0aghxr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Oct 2022 23:20:06 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 29QM4AB5032835; Wed, 26 Oct 2022 23:20:04 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2173.outbound.protection.outlook.com [104.47.73.173])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3kfagmdy80-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Oct 2022 23:20:04 +0000
Received: from DM5PR10MB1466.namprd10.prod.outlook.com (2603:10b6:3:b::7) by
 DS7PR10MB5117.namprd10.prod.outlook.com (2603:10b6:5:3a6::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.28; Wed, 26 Oct 2022 23:20:02 +0000
Received: from DM5PR10MB1466.namprd10.prod.outlook.com
 ([fe80::19f7:e081:85b4:c5df]) by DM5PR10MB1466.namprd10.prod.outlook.com
 ([fe80::19f7:e081:85b4:c5df%7]) with mapi id 15.20.5746.028; Wed, 26 Oct 2022
 23:20:02 +0000
From: Mike Christie <michael.christie@oracle.com>
To: bvanassche@acm.org, hch@lst.de, martin.petersen@oracle.com,
 linux-scsi@vger.kernel.org, james.bottomley@hansenpartnership.com,
 linux-block@vger.kernel.org, dm-devel@redhat.com, snitzer@kernel.org,
 axboe@kernel.dk, linux-nvme@lists.infradead.org, chaitanyak@nvidia.com,
 kbusch@kernel.org, target-devel@vger.kernel.org
Date: Wed, 26 Oct 2022 18:19:36 -0500
Message-Id: <20221026231945.6609-11-michael.christie@oracle.com>
In-Reply-To: <20221026231945.6609-1-michael.christie@oracle.com>
References: <20221026231945.6609-1-michael.christie@oracle.com>
X-ClientProxiedBy: CH2PR10CA0012.namprd10.prod.outlook.com
 (2603:10b6:610:4c::22) To DM5PR10MB1466.namprd10.prod.outlook.com
 (2603:10b6:3:b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR10MB1466:EE_|DS7PR10MB5117:EE_
X-MS-Office365-Filtering-Correlation-Id: ba374dd7-d96a-429f-6a05-08dab7a89c13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: SxOcYluDr/AY+LSvZwShCV6r2c8diTC4cQQ+lBa6OSvjoaiQHDww/uP7hiUQ/luOqYj4DQh4Lo1rOvLz81o+tLFCEBW8PYn929s5SiSppZFTx9avF1B6RB7eCGnBBCag2Ag7UKKa+YzSSml50V80iR3EigHqEApgi6s5DFL0/CBmK/kSyTRE2r2RRCwLMqBJRQw666sXP2ljV3X1NlvyZKbNfhBajkSDP+fCL+EgRbMfkqyrcO0fHBhRe6XvVqERHz8mVcxWEVxUmex+tKSFDZjDEz16r5EDZBVx366yXY48+bD2HexfgrbOpB1EmcHRusp5/fJ0ElQm4Pq2YT2KNHOnKjJk+CIagf9dl95IsgrQDQ8QjIra5jZXZiltwfnHlyVtqIWDRQEMTQagIUNOmQU5n1lTynHXtVIyo5kCAIQ9waqP2FNATwv0u1meq1WlQgvLWgSNXAaSFlyVZbTUrDhi8AVqysHXFCYYpRW2F77D8XpR4goxP5jwneLH8p89RfklEcHrXBdyUq/NSIkDS9pFJS+AYVS6bmmALQ4J9MCWWjMGe/CD0cpN0115HU6sjjp9AI7EYRG7JeOkRZECmDTEk0R/x1S4BTtYBZYJn4mouJjObH8A+Vb1gisldcckZpCv2e9TXtQ4SSRItJfFeRgMuAxTRLOREYDSa2jMirJwAT8vM6qXPn6zkr6djpbbSymQANj7qmrSziAbp0O5huB2ElAUExI5H0U0il99r/LUn96rh7MOeYeGzdNLIhJt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR10MB1466.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(366004)(136003)(346002)(396003)(376002)(451199015)(7416002)(8936002)(2616005)(1076003)(186003)(5660300002)(6512007)(41300700001)(26005)(86362001)(921005)(38100700002)(2906002)(36756003)(83380400001)(316002)(107886003)(6666004)(4326008)(66556008)(66946007)(66476007)(8676002)(6506007)(478600001)(6486002);
 DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rj2lkZeau/Pvd6pcCAKthIRlzNKWugHiSZFrTc4+yo7BUtx+slJVBvN+Aes4?=
 =?us-ascii?Q?tPWfCcoNtt4/8sxSGvU4brRy+jlIG36a6DcazBCj9avOmzx1vRM/bE8KMmCD?=
 =?us-ascii?Q?ij3f1EVpHIvIlIQXrfopT33H9Ra8qg1oQnCXe0eef9YAw30D2nLkiQx9YecC?=
 =?us-ascii?Q?60N43A1IZeJi+Zhy4V5oxsu5e0X7pTYxiZIzmb8isR9DTtvR0MR/dG1D/Zl7?=
 =?us-ascii?Q?4hYVKlOOYAD+nH1OM2fshah2Q+RKepJgbjW9yz6abdQGCOW9jODF7GnZ2Uem?=
 =?us-ascii?Q?4NorZuFjH7CLh80E/wiig7kHRGPvR8Mvn/ulp6Ft4AssXK3Sii7sAPs8Jmqz?=
 =?us-ascii?Q?sSwQsQYhkN4QLVd2kuIvSdzEzPhHTlDAwWv+G4IPpYpBgdsfUG6xYietZGyX?=
 =?us-ascii?Q?q9Ir1jj0LpWQvjkI7A0Smv/FrV+53k5Nv7IksmvPvLDiA4bHLReNHssf+ZUu?=
 =?us-ascii?Q?draThFO/k6tboHnf6v9zp+kV/rvSlWHXqvCKlzBSIjGiZRWRgx5aOE7LuH63?=
 =?us-ascii?Q?Eaw9BUqbxDPL3GNSBlL+YhmRpMV2yAtrWK12jt09n10yg5I8Jau+AnDu2/ZW?=
 =?us-ascii?Q?h2S9Izr7+tawhJoBasPp4Jpvd1ZYpjKT9n1pMosflAOFRVgSUKBHLC/0pxCK?=
 =?us-ascii?Q?jsaC9AlcrIVnTE8zC1wXGGsSjPMSHXtaEL+cruGnCfDEXGUht+GcsyZKht/N?=
 =?us-ascii?Q?TdmpzPJctbCfdQJv1Km1QlZ0ORixIfIsvZYKwmjtg0zJJniZxmcMIqfzCP+h?=
 =?us-ascii?Q?25KnW4dGhntqKrL5rwpkOuUaRRQHswa3pA+2Ta8QpOyY3Zxq1H2VpinsZ9Dw?=
 =?us-ascii?Q?mnvv8Egnwe0f0x63vEQH6Jg8bYRHBM7iVTIE0qcLx6BLVwxbUXVqnQd5oPgG?=
 =?us-ascii?Q?UT5qCDEgADiY1dCUPffTtoKWEqT4zHPpVgprlS085xmEN9cgB79JXquW9wbz?=
 =?us-ascii?Q?g/E3kreuZEIrYHOZBExTXWCsL+I7bCuwEk/bWMYi5oqB162yatibpDlbpvu9?=
 =?us-ascii?Q?MbmcYGLWapnoyv5+kJrlEWaAJeUjYyxKo9QPDOcVmR7WRVLdvheSNdbjFJDZ?=
 =?us-ascii?Q?0a8pOHGo61avhUCwUUdq9izDKFrbERQnN9hYkgXd8ZvQgr4wnaJN2evC14uU?=
 =?us-ascii?Q?3jn2hRHYEyGTOAD2Gm7AsR1lrw//xYHWtPeE7swD7R9xGgJtkUPXqYZ5zMWp?=
 =?us-ascii?Q?mV0CMI9WaALWEPOkXE0UctpI5UgBWMI8s+j73UCrQNS+Mvo7q4Zj8kx3LHAx?=
 =?us-ascii?Q?W9pGFkSkVC/5fnebfo717QClJZZ76jdZBxm4dd+OkGW16duAd29CWKPqtm1z?=
 =?us-ascii?Q?MThLgdsldG01qI6nNxTMpS9xV8RaY2xQWuSgjoGW2yK+HNM81adg7sGLqEDB?=
 =?us-ascii?Q?/9bX1q9+Q8zpyzVbdgyLiS+GvDEmTJ9ZuLCL0umITIGGzXdpr1NmzDE/dTvy?=
 =?us-ascii?Q?EH0+OtLXqsHpp0laA1LnXs2ZNZnNBaMSLh6Gk7vF3AkjcruEqbThfkZS4hTW?=
 =?us-ascii?Q?LQiOvv8i4s7jnMJ7Mz91xOh4yFGf0LLQ45aBufqjUSewj0nksaNpzE12p/GD?=
 =?us-ascii?Q?5ifUdm5gwbEnfkzX3iSz0mFCSSjHtedS3S5Os/1wu3LU2wmLYe12zwz9OOdT?=
 =?us-ascii?Q?Ew=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba374dd7-d96a-429f-6a05-08dab7a89c13
X-MS-Exchange-CrossTenant-AuthSource: DM5PR10MB1466.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 23:20:02.8503 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 524eLFiv/ih/RXTsOb3GYGo4LKwqVKHRJfrgq2BEeR8ysCa35CeWZRmx26bAnOJci41KEsl6nbKIYEtkHT3F7nGDJ1Q9qsthmGTt69L3ihE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5117
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-26_08,2022-10-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0
 mlxlogscore=999 malwarescore=0 suspectscore=0 phishscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210260128
X-Proofpoint-GUID: 4A1yCVmJwFXOx-DiNsnF8OLo6PhGMjWu
X-Proofpoint-ORIG-GUID: 4A1yCVmJwFXOx-DiNsnF8OLo6PhGMjWu
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mailman-Approved-At: Mon, 31 Oct 2022 06:38:42 +0000
Subject: [dm-devel] [PATCH v3 10/19] nvme: Move NVMe and Block PR types to
 an array
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: Mike Christie <michael.christie@oracle.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

For Reservation Report support we need to also convert from the NVMe spec
PR type back to the block PR definition. This moves us to an array, so in
the next patch we can add another helper to do the conversion without
having to manage 2 switches.

Signed-off-by: Mike Christie <michael.christie@oracle.com>
---
 drivers/nvme/host/pr.c | 42 +++++++++++++++++++++++-------------------
 include/linux/nvme.h   |  9 +++++++++
 2 files changed, 32 insertions(+), 19 deletions(-)

diff --git a/drivers/nvme/host/pr.c b/drivers/nvme/host/pr.c
index df7eb2440c67..5c4611d15d9c 100644
--- a/drivers/nvme/host/pr.c
+++ b/drivers/nvme/host/pr.c
@@ -6,24 +6,28 @@
 
 #include "nvme.h"
 
-static char nvme_pr_type(enum pr_type type)
+static const struct {
+	enum nvme_pr_type	nvme_type;
+	enum pr_type		blk_type;
+} nvme_pr_types[] = {
+	{ NVME_PR_WRITE_EXCLUSIVE, PR_WRITE_EXCLUSIVE },
+	{ NVME_PR_EXCLUSIVE_ACCESS, PR_EXCLUSIVE_ACCESS },
+	{ NVME_PR_WRITE_EXCLUSIVE_REG_ONLY, PR_WRITE_EXCLUSIVE_REG_ONLY },
+	{ NVME_PR_EXCLUSIVE_ACCESS_REG_ONLY, PR_EXCLUSIVE_ACCESS_REG_ONLY },
+	{ NVME_PR_WRITE_EXCLUSIVE_ALL_REGS, PR_WRITE_EXCLUSIVE_ALL_REGS },
+	{ NVME_PR_EXCLUSIVE_ACCESS_ALL_REGS, PR_EXCLUSIVE_ACCESS_ALL_REGS },
+};
+
+static enum nvme_pr_type nvme_pr_type_from_blk(enum pr_type type)
 {
-	switch (type) {
-	case PR_WRITE_EXCLUSIVE:
-		return 1;
-	case PR_EXCLUSIVE_ACCESS:
-		return 2;
-	case PR_WRITE_EXCLUSIVE_REG_ONLY:
-		return 3;
-	case PR_EXCLUSIVE_ACCESS_REG_ONLY:
-		return 4;
-	case PR_WRITE_EXCLUSIVE_ALL_REGS:
-		return 5;
-	case PR_EXCLUSIVE_ACCESS_ALL_REGS:
-		return 6;
-	default:
-		return 0;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(nvme_pr_types); i++) {
+		if (nvme_pr_types[i].blk_type == type)
+			return nvme_pr_types[i].nvme_type;
 	}
+
+	return 0;
 }
 
 static int nvme_send_ns_head_pr_command(struct block_device *bdev,
@@ -91,7 +95,7 @@ static int nvme_pr_reserve(struct block_device *bdev, u64 key,
 	if (flags & ~PR_FL_IGNORE_KEY)
 		return -EOPNOTSUPP;
 
-	cdw10 = nvme_pr_type(type) << 8;
+	cdw10 = nvme_pr_type_from_blk(type) << 8;
 	cdw10 |= ((flags & PR_FL_IGNORE_KEY) ? 1 << 3 : 0);
 	return nvme_pr_command(bdev, cdw10, key, 0, nvme_cmd_resv_acquire);
 }
@@ -99,7 +103,7 @@ static int nvme_pr_reserve(struct block_device *bdev, u64 key,
 static int nvme_pr_preempt(struct block_device *bdev, u64 old, u64 new,
 		enum pr_type type, bool abort)
 {
-	u32 cdw10 = nvme_pr_type(type) << 8 | (abort ? 2 : 1);
+	u32 cdw10 = nvme_pr_type_from_blk(type) << 8 | (abort ? 2 : 1);
 
 	return nvme_pr_command(bdev, cdw10, old, new, nvme_cmd_resv_acquire);
 }
@@ -113,7 +117,7 @@ static int nvme_pr_clear(struct block_device *bdev, u64 key)
 
 static int nvme_pr_release(struct block_device *bdev, u64 key, enum pr_type type)
 {
-	u32 cdw10 = nvme_pr_type(type) << 8 | (key ? 0 : 1 << 3);
+	u32 cdw10 = nvme_pr_type_from_blk(type) << 8 | (key ? 0 : 1 << 3);
 
 	return nvme_pr_command(bdev, cdw10, key, 0, nvme_cmd_resv_release);
 }
diff --git a/include/linux/nvme.h b/include/linux/nvme.h
index 5bc9c84dc216..d0bd15f527fc 100644
--- a/include/linux/nvme.h
+++ b/include/linux/nvme.h
@@ -757,6 +757,15 @@ enum {
 	NVME_LBART_ATTRIB_HIDE	= 1 << 1,
 };
 
+enum nvme_pr_type {
+	NVME_PR_WRITE_EXCLUSIVE			= 1,
+	NVME_PR_EXCLUSIVE_ACCESS		= 2,
+	NVME_PR_WRITE_EXCLUSIVE_REG_ONLY	= 3,
+	NVME_PR_EXCLUSIVE_ACCESS_REG_ONLY	= 4,
+	NVME_PR_WRITE_EXCLUSIVE_ALL_REGS	= 5,
+	NVME_PR_EXCLUSIVE_ACCESS_ALL_REGS	= 6,
+};
+
 enum nvme_eds {
 	NVME_EXTENDED_DATA_STRUCT	= 0x1,
 };
-- 
2.25.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

