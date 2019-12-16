Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id A5BAE12021D
	for <lists+dm-devel@lfdr.de>; Mon, 16 Dec 2019 11:17:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576491429;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=eNXG25yykY2phMMCPUkWu7urJA+QxWA6DjAcoTM+hh4=;
	b=bdDAGVGjgXhiD2ElhUC6GwENTx2FNOOd+KJ4AJMSiN4XSCcHGcvGsDYxBltk0eBE4AgnB6
	FyBkIuMJzCpscufffOB3ETKQjuQr5lNOER/L7JsNBkTwDHu4mjY7z+KusHs++WzybrXxYz
	77DRvYn+M6OCh2UZr+znpWK/FdmMnmk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-aUzJDBmcNLqZ26_OOWxXuw-1; Mon, 16 Dec 2019 05:17:05 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18AF9DB20;
	Mon, 16 Dec 2019 10:16:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E0E301001B07;
	Mon, 16 Dec 2019 10:16:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 74ADFADAAB;
	Mon, 16 Dec 2019 10:16:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBG22tbl016380 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 15 Dec 2019 21:02:56 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BD94E2166B2D; Mon, 16 Dec 2019 02:02:55 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B88892166B2C
	for <dm-devel@redhat.com>; Mon, 16 Dec 2019 02:02:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A211D10192A0
	for <dm-devel@redhat.com>; Mon, 16 Dec 2019 02:02:53 +0000 (UTC)
Received: from APC01-HK2-obe.outbound.protection.outlook.com
	(mail-eopbgr1300087.outbound.protection.outlook.com [40.107.130.87])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-423-IpWd2sv0Pe67MJVdlkKPpg-1; Sun, 15 Dec 2019 21:02:49 -0500
Received: from SG2PR0401CA0001.apcprd04.prod.outlook.com (2603:1096:3:1::11)
	by HK0PR04MB2564.apcprd04.prod.outlook.com (2603:1096:203:67::10) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.15;
	Mon, 16 Dec 2019 02:02:45 +0000
Received: from PU1APC01FT049.eop-APC01.prod.protection.outlook.com
	(2a01:111:f400:7ebd::208) by SG2PR0401CA0001.outlook.office365.com
	(2603:1096:3:1::11) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.15 via
	Frontend Transport; Mon, 16 Dec 2019 02:02:44 +0000
Received: from mail.transsion.com (27.115.63.14) by
	PU1APC01FT049.mail.protection.outlook.com (10.152.253.9) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
	15.20.2538.15 via Frontend Transport; Mon, 16 Dec 2019 02:02:43 +0000
Received: from SH-EXC-MX01.transsion.com (10.150.2.41) by
	SH-EXC-MX01.transsion.com (10.150.2.41) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1591.10; Mon, 16 Dec 2019 10:02:33 +0800
Received: from SH-EXC-MX01.transsion.com ([fe80::a9c9:4b06:6245:846c]) by
	SH-EXC-MX01.transsion.com ([fe80::a9c9:4b06:6245:846c%13]) with mapi id
	15.01.1591.008; Mon, 16 Dec 2019 10:02:33 +0800
From: =?gb2312?B?eGlhbnJvbmcuemhvdSjW3M/IyNkp?= <xianrong.zhou@transsion.com>
To: Eric Biggers <ebiggers@kernel.org>
Thread-Topic: Reply [PATCH] dm-verity: unnecessary data blocks that need not
	read hash blocks
Thread-Index: AdWztMxRz9kVwcU5TJCkJS5tt5ezYg==
Date: Mon, 16 Dec 2019 02:02:33 +0000
Message-ID: <727b9e9279a546beb2ae63a18eae6ab0@transsion.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.150.151.93]
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:27.115.63.14; IPV:; CTRY:CN; EFV:NLI; SFV:NSPM;
	SFS:(10009020)(346002)(376002)(39850400004)(136003)(396003)(1110001)(339900001)(199004)(189003)(316002)(2906002)(5660300002)(8676002)(4326008)(8936002)(81166006)(6916009)(336012)(478600001)(186003)(26005)(426003)(81156014)(70206006)(54906003)(108616005)(85182001)(356004)(36756003)(86362001)(2616005)(70586007)(7696005)(24736004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:HK0PR04MB2564;
	H:mail.transsion.com; FPR:; SPF:Fail; LANG:en;
	PTR:mail.reallytek.com; A:1; MX:1;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c813980-4f7a-48c6-4836-08d781cc09ee
X-MS-TrafficTypeDiagnostic: HK0PR04MB2564:
X-Microsoft-Antispam-PRVS: <HK0PR04MB256419E689FBE9AA81B992D1F8510@HK0PR04MB2564.apcprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-Forefront-PRVS: 02530BD3AA
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pZBBX22bDThTCzV21FdYsZx4HhRYRbBijLxObb6JM2/Ht1JU7YtMyMXV4bKb7z64wHGxaxVtJhyuf/lhRWNkJxbHgamIyI5iFGVjkCNLi6MmDIbU0zoJ3DEtNgobOi/Kr7ikvgtqi1epsX2Yi4bFopHdLlmr6l3fA04n7sOMJllqqdiDCG7nSSni/5ZS/LfWxjIQs9AzDRlQ73KGGrbR3a/oP9zj/MHlW5KrvzJ2Fjqq5GoFbGcLwY4ycFdhdYS2chz4TUEYcc9EOGtR4CdaqCpvzhYb+kGnSxV1SlE7vTtOQkG+O7+UUA4swUPLq3zxVc1awAvOLR3CG9lbUvDg+oUbaimAtWdIfPHv1sSb1tnhW22llt0hDt4maPybvsJHlef8weg4awbuf26FwuQqRJuVmOC1RkB71TwhZlnM0w7zfYUYwA67Izcz8D7jY0Ln
X-OriginatorOrg: transsion.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2019 02:02:43.4375 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c813980-4f7a-48c6-4836-08d781cc09ee
X-MS-Exchange-CrossTenant-Id: 2e8503a6-2d01-4333-8e36-6ab7c8cd7ae2
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=2e8503a6-2d01-4333-8e36-6ab7c8cd7ae2; Ip=[27.115.63.14];
	Helo=[mail.transsion.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR04MB2564
X-MC-Unique: IpWd2sv0Pe67MJVdlkKPpg-1
X-MC-Unique: aUzJDBmcNLqZ26_OOWxXuw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from base64 to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xBG22tbl016380
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 16 Dec 2019 05:16:37 -0500
Cc: =?gb2312?B?d2VpbWluLm1hbyjDq87Aw/Ep?= <weimin.mao@transsion.com>,
	=?gb2312?B?aGFpemhvdS5zb25nKMvOuqPW2yk=?= <haizhou.song@transsion.com>,
	"snitzer@redhat.com" <snitzer@redhat.com>,
	=?gb2312?B?d2FuYmluLndhbmcozfTN8rHzKQ==?= <wanbin.wang@transsion.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?gb2312?B?eXVhbmppb25nLmdhbyi439Sovrwp?= <yuanjiong.gao@transsion.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	=?gb2312?B?cnV4aWFuLmZlbmcot+vI5ea1KQ==?= <ruxian.feng@transsion.com>,
	"agk@redhat.com" <agk@redhat.com>
Subject: [dm-devel] Reply [PATCH] dm-verity: unnecessary data blocks that
 need not read hash blocks
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

hey Eric:

On Wed, Dec 11, 2019 at 11:32:40AM +0800, zhou xianrong wrote:
> From: "xianrong.zhou" <xianrong.zhou@transsion.com>
> 
> If check_at_most_once enabled, just like verity work the prefetching 
> work should check for data block bitmap firstly before reading hash 
> block as well. Skip bit-set data blocks from both ends of data block 
> range by testing the validated bitmap. This can reduce the amounts of 
> data blocks which need to read hash blocks.
> 
> Launching 91 apps every 15s and repeat 21 rounds on Android Q.
> In prefetching work we can let only 2602/360312 = 0.72% data blocks 
> really need to read hash blocks.
> 
> But the reduced data blocks range would be enlarged again by 
> dm_verity_prefetch_cluster later.
> 
> Signed-off-by: xianrong.zhou <xianrong.zhou@transsion.com>
> Signed-off-by: yuanjiong.gao <yuanjiong.gao@transsion.com>
> Tested-by: ruxian.feng <ruxian.feng@transsion.com>
> ---
>  drivers/md/dm-verity-target.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/md/dm-verity-target.c 
> b/drivers/md/dm-verity-target.c index 4fb33e7562c5..7b8eb754c0b6 
> 100644
> --- a/drivers/md/dm-verity-target.c
> +++ b/drivers/md/dm-verity-target.c
> @@ -581,6 +581,22 @@ static void verity_prefetch_io(struct work_struct *work)
>  	struct dm_verity *v = pw->v;
>  	int i;
>  
> +	if (v->validated_blocks) {
> +		while (pw->n_blocks) {
> +			if (unlikely(!test_bit(pw->block, v->validated_blocks)))
> +				break;
> +			pw->block++;
> +			pw->n_blocks--;
> +		}
> +		while (pw->n_blocks) {
> +			if (unlikely(!test_bit(pw->block + pw->n_blocks - 1,
> +				v->validated_blocks)))
> +				break;
> +			pw->n_blocks--;
> +		}
> +		if (!pw->n_blocks)
> +			return;
> +	}

This is a good idea, but shouldn't this logic go in verity_submit_prefetch() prior to the struct dm_verity_prefetch_work being allocated?  Then if no prefeching is needed, allocating and scheduling the work object can be skipped.

Eric, Do you mean it is more suitable in dm_bufio_prefetch which is called on different paths even though prefeching is disabled ?

Also note that you're currently leaking the work object with the early return.	

Right! I leaked this. always so. Thanks!!!

- Eric

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

