Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 02239613083
	for <lists+dm-devel@lfdr.de>; Mon, 31 Oct 2022 07:39:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667198355;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XaoS1RRktHprJ/moQ7r7BVfKWD6BTjkqFhJ7XGs1n/o=;
	b=NWJuqKnSGwjlP17v2EFz2RT19C8P5TA5HNoSQzj+RTCVHOa8P4njExyrzCyQxxE8Uzfo2i
	SSFAJA8SqMG1W6IHitUOoj+CtyJ7tKBT3Q0bmUhGDcKyk9oFIIUeetCk5MrJZUbx7zurx5
	tNZ1BkkDtAWeQYxfS1Njv4CRTIVymC8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-Snv5-K0VNuiG370lEinhoA-1; Mon, 31 Oct 2022 02:38:57 -0400
X-MC-Unique: Snv5-K0VNuiG370lEinhoA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C24E1C08994;
	Mon, 31 Oct 2022 06:38:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5EE9CC2C7F3;
	Mon, 31 Oct 2022 06:38:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A5DDE1946A4F;
	Mon, 31 Oct 2022 06:38:50 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id E61F21946597
 for <dm-devel@listman.corp.redhat.com>; Thu, 27 Oct 2022 00:21:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D4416111E3E8; Thu, 27 Oct 2022 00:21:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CB8541121339
 for <dm-devel@redhat.com>; Thu, 27 Oct 2022 00:21:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B145811E67
 for <dm-devel@redhat.com>; Thu, 27 Oct 2022 00:21:12 +0000 (UTC)
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-322-YfdDlajfOjejKdJQ5fPMGQ-1; Wed, 26 Oct 2022 20:21:11 -0400
X-MC-Unique: YfdDlajfOjejKdJQ5fPMGQ-1
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29QMJdIH028928;
 Wed, 26 Oct 2022 23:19:59 GMT
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kfawrrhf8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Oct 2022 23:19:58 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 29QM2B76011647; Wed, 26 Oct 2022 23:19:58 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2171.outbound.protection.outlook.com [104.47.73.171])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3kfagqduvx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Oct 2022 23:19:58 +0000
Received: from DM5PR10MB1466.namprd10.prod.outlook.com (2603:10b6:3:b::7) by
 DS7PR10MB5117.namprd10.prod.outlook.com (2603:10b6:5:3a6::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.28; Wed, 26 Oct 2022 23:19:56 +0000
Received: from DM5PR10MB1466.namprd10.prod.outlook.com
 ([fe80::19f7:e081:85b4:c5df]) by DM5PR10MB1466.namprd10.prod.outlook.com
 ([fe80::19f7:e081:85b4:c5df%7]) with mapi id 15.20.5746.028; Wed, 26 Oct 2022
 23:19:56 +0000
From: Mike Christie <michael.christie@oracle.com>
To: bvanassche@acm.org, hch@lst.de, martin.petersen@oracle.com,
 linux-scsi@vger.kernel.org, james.bottomley@hansenpartnership.com,
 linux-block@vger.kernel.org, dm-devel@redhat.com, snitzer@kernel.org,
 axboe@kernel.dk, linux-nvme@lists.infradead.org, chaitanyak@nvidia.com,
 kbusch@kernel.org, target-devel@vger.kernel.org
Date: Wed, 26 Oct 2022 18:19:31 -0500
Message-Id: <20221026231945.6609-6-michael.christie@oracle.com>
In-Reply-To: <20221026231945.6609-1-michael.christie@oracle.com>
References: <20221026231945.6609-1-michael.christie@oracle.com>
X-ClientProxiedBy: CH2PR19CA0025.namprd19.prod.outlook.com
 (2603:10b6:610:4d::35) To DM5PR10MB1466.namprd10.prod.outlook.com
 (2603:10b6:3:b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR10MB1466:EE_|DS7PR10MB5117:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c7b2544-e442-4512-d4f4-08dab7a8981b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0
X-Microsoft-Antispam-Message-Info: 5IDBBhJrITv9lPB9kkUe8saGSkznGuh+IKsqWqa2QwFZku4a+UK8cp/gYCDkKfexzTxEdbSzC0EpmJzc4LwJYpNDGwz4QwGmMGQG5F10GjSJlw4X7C/kG3CYnxrRT6Ias05YU5wHFZBumgto1/qV67Ii5fNZJFT/e3gKMuXxruNDP3WLNtdkaaOevDq68lkQQKpsE7UNqePyqKERZoXvoCZlB7Re1x+Rg7uPI/lXXtobzRduhwPs/AxMCCpZv5pD0U345ANIbX6h37QIwrnjVouKOnixbGOsmktK49WoD+oZTSNUAiRdoGPiTrq28NqOFTgdD6P0uY+XOkHGVbn943el9TKqOb48gU3EcXF0LD4l64jTN+l8Bv0iG9g2hzSnOHtMJb1rfdoXAGkgWCYdrAlWATqbjl2fPLs7CpycQJ+sjJMbTxHywg1RLwt9Q/7gyHeVVOdYc/hnCwcSBTqaXfxcZ4qF4f+zPUKxOpAVyB49tqqOtf1NGkAr7GXfWwaeAfc808jsQFTh/mRRJwsckx/MvK+0/XSr+AR8ICXREy6ykNrgEMig1ImTRq+P7mmVR94TfkUCxPNZ/E3RVLYs7T3N/JlpLg1i2vNDCS+QvB1Xg1lyzMh4SFRpRJgAemiSaEDVbtGqZ7PYpyzPbab7GROlsd/KiI8bhlh0Rn6pWouku3PDr8CsX31Ss4Omq276rlWtF5Mt9FQ5ALtJOQx+c68KIULOCLIGv/yjS8/9ye19j6OAeQgaaSodq3kH614+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR10MB1466.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(366004)(136003)(346002)(396003)(376002)(451199015)(7416002)(8936002)(2616005)(1076003)(186003)(5660300002)(6512007)(41300700001)(26005)(86362001)(921005)(38100700002)(2906002)(36756003)(83380400001)(316002)(107886003)(6666004)(4326008)(66556008)(66946007)(66476007)(8676002)(6506007)(478600001)(6486002);
 DIR:OUT; SFP:1101
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XnaxGl7WpN5nsbSJnrJQ3wFql+/EuUNs9DSKZbduSj260ongWVQl5rVlYW6N?=
 =?us-ascii?Q?r7Apt4uSoMmE8Xtq2MQW7ujqnjok3W+yc0YZsPlTdExJJWTuJpo4XS3Qzk2L?=
 =?us-ascii?Q?TssM3esEqDXF9DnUWInNkkHceJgnSkvMNt6Gy/D/iAwN4UZX62KawukIeB01?=
 =?us-ascii?Q?b2rA4f/15YpKsAgSBstVsCwU0w8BWmfnHHPY5l7x6lUa/F7p7QXFg4jijFxr?=
 =?us-ascii?Q?kuuH6FiFDUVHD4IKG7RF3EJclwJS0mYPQWUdzNG4ZvizdjKADx9KhY/KmMXD?=
 =?us-ascii?Q?sctqiY4+IwNhqMe9DyYXz7FGXNbbcbRylBrq24U8Z8oASsiHnjT+e15vHyo3?=
 =?us-ascii?Q?iAIEBiQF6hyT5QIiHcv4Rxoq+lCSNtb5Eqxp5GwCqvUH8HAcAcHmnBBUpG2N?=
 =?us-ascii?Q?+eFkZqt1RkgaH/LdDqCxuOaX9SHT2hvP1DyMYuR3AiOMdfcfLnuK/QTr7hIH?=
 =?us-ascii?Q?SgiboqKcC5TNBKPJxsY18N0bWn/HjAylbWQicKIyvLllZ00JW13AwWz7Gks2?=
 =?us-ascii?Q?VE1wCjfHjyZGdZ80zN86ZJyEeIFRBELJuZuQUftiMUYC+jy/gCCu+X7OzTuy?=
 =?us-ascii?Q?ghORQiikPIc8dbH5vFW2I/X2Pd2k9Ew55MmUFQgTHZxLYrgEoSpcfqVwC0Wr?=
 =?us-ascii?Q?azgJ9DbxWO4AoffYU+9zBPIpS1qGl+4lIW95m6Db0Ht5asyLhclphiqqdSbr?=
 =?us-ascii?Q?OYwYbci4W6geacP2JBlmNKAa/j6E0fgGQzXJdt2Knl+E44jROC+Suihc9x//?=
 =?us-ascii?Q?ja9BaBZ2VlGFUM3oJcHqJKiiXkdO/Glm6qG4K+osiaCnIWXY9+Q62opaOGLZ?=
 =?us-ascii?Q?PCWVZs12KOAx0zljT++qnb6i5U7/njrLExOkuV/1miIMvext2j43eEeMLJtO?=
 =?us-ascii?Q?/IzK6hUVIsygUDfKdXzKx11/4mdafiPy6H18LPp6HwIpxLUmyDQHeV6KCGZw?=
 =?us-ascii?Q?l0x+yECu6efwGAalNCO7+E8lxGTAxmJGNKBD4jiBIrLW8e1NymbxJJ0Gg0YX?=
 =?us-ascii?Q?qD5/5GBbyBtcWJGvJgF9Nn6k7ApfQtQ3YdCn8iHEgIHP1oRdXfDdd0kRq8mc?=
 =?us-ascii?Q?o8xks9dXEDE5kY5mUjsqT2gyRveesiZobWjSeAvdBtnz0uyIrzEpgkN4iUlz?=
 =?us-ascii?Q?hXJXFgUXYX2fam+ApoXOVorj8SNI66Men8JglGqL4F8EgDaIvRoDTDFewYtW?=
 =?us-ascii?Q?2H3qGN+dmH0ZwHz7OzdfKyFby5oNELeZ0gNzbZ99aM0a3Rzprr1IfQOEHAZ5?=
 =?us-ascii?Q?q+aQq9KNEnYO1yqyyT0RZH+upMmdN/t1tKh+KxERXr88jndlAKcUJMRW0rLu?=
 =?us-ascii?Q?C54guFmjZdshJiiPdsuN/c1SO8G8HPeY1/EQdP0VMEzeswYzMvdVPc/7yBOy?=
 =?us-ascii?Q?+SHGcuBJKKjXYVJqbHH4kbpnS5At8DCh3Ah2CReGS8KaOSsXnepfuZhYCqAj?=
 =?us-ascii?Q?R4rHl3A4/E/a5fJQdkkuxx37BogTFywCXkRIH0AWp3GBRB/y7BX0cI7U1Sn0?=
 =?us-ascii?Q?g1IUM8BqQZOaF9Rv2zP2g+DFIQ/fjYBgYXEsgVKNi4P4LDJel5z5kpZlERfi?=
 =?us-ascii?Q?tAB4rBXQfN9oQu1jr7ByEdIDjIekfuDm+7kv3HUuo6NMy5aFlsFzA/sSRC45?=
 =?us-ascii?Q?TQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c7b2544-e442-4512-d4f4-08dab7a8981b
X-MS-Exchange-CrossTenant-AuthSource: DM5PR10MB1466.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 23:19:56.2414 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7bjljV5aOXU7+8NSto4aj6DW/r+CSX+zeZZ/8rMoWRt7Tk7iyIbphq/KyOpO1yggMLU4ecc+3Rn1XEX9ywD0/eJAett1h8lLrFrthAlBvM8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5117
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-26_08,2022-10-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2210260128
X-Proofpoint-ORIG-GUID: A5dr16pZMHuDjGRcmnUhPUTMOdu339_b
X-Proofpoint-GUID: A5dr16pZMHuDjGRcmnUhPUTMOdu339_b
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mailman-Approved-At: Mon, 31 Oct 2022 06:38:42 +0000
Subject: [dm-devel] [PATCH v3 05/19] dm: Add support for block PR read
 keys/reservation
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This adds support in dm for the block PR read keys and read reservation
callouts.

Signed-off-by: Mike Christie <michael.christie@oracle.com>
---
 drivers/md/dm.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 95a1ee3d314e..f7f806890c92 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -3312,12 +3312,56 @@ static int dm_pr_clear(struct block_device *bdev, u64 key)
 	return r;
 }
 
+static int dm_pr_read_keys(struct block_device *bdev, struct pr_keys *keys,
+			   u32 keys_len)
+{
+	struct mapped_device *md = bdev->bd_disk->private_data;
+	const struct pr_ops *ops;
+	int r, srcu_idx;
+
+	r = dm_prepare_ioctl(md, &srcu_idx, &bdev);
+	if (r < 0)
+		goto out;
+
+	ops = bdev->bd_disk->fops->pr_ops;
+	if (ops && ops->pr_read_keys)
+		r = ops->pr_read_keys(bdev, keys, keys_len);
+	else
+		r = -EOPNOTSUPP;
+out:
+	dm_unprepare_ioctl(md, srcu_idx);
+	return r;
+}
+
+static int dm_pr_read_reservation(struct block_device *bdev,
+				  struct pr_held_reservation *rsv)
+{
+	struct mapped_device *md = bdev->bd_disk->private_data;
+	const struct pr_ops *ops;
+	int r, srcu_idx;
+
+	r = dm_prepare_ioctl(md, &srcu_idx, &bdev);
+	if (r < 0)
+		goto out;
+
+	ops = bdev->bd_disk->fops->pr_ops;
+	if (ops && ops->pr_read_reservation)
+		r = ops->pr_read_reservation(bdev, rsv);
+	else
+		r = -EOPNOTSUPP;
+out:
+	dm_unprepare_ioctl(md, srcu_idx);
+	return r;
+}
+
 static const struct pr_ops dm_pr_ops = {
 	.pr_register	= dm_pr_register,
 	.pr_reserve	= dm_pr_reserve,
 	.pr_release	= dm_pr_release,
 	.pr_preempt	= dm_pr_preempt,
 	.pr_clear	= dm_pr_clear,
+	.pr_read_keys	= dm_pr_read_keys,
+	.pr_read_reservation = dm_pr_read_reservation,
 };
 
 static const struct block_device_operations dm_blk_dops = {
-- 
2.25.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

