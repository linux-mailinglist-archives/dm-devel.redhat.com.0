Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D987CD53D2
	for <lists+dm-devel@lfdr.de>; Sun, 13 Oct 2019 04:47:48 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DACDF3084242;
	Sun, 13 Oct 2019 02:47:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 363DD5DC1E;
	Sun, 13 Oct 2019 02:47:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1456C4E589;
	Sun, 13 Oct 2019 02:47:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9D2i6j9025387 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Oct 2019 22:44:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 503FB5D712; Sun, 13 Oct 2019 02:44:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 462905D6A3
	for <dm-devel@redhat.com>; Sun, 13 Oct 2019 02:44:03 +0000 (UTC)
Received: from listssympa-test.colorado.edu (listssympa-test.colorado.edu
	[128.138.129.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9AE2E36899
	for <dm-devel@redhat.com>; Sun, 13 Oct 2019 02:44:02 +0000 (UTC)
Received: from listssympa-test.colorado.edu (localhost [127.0.0.1])
	by listssympa-test.colorado.edu (8.15.2/8.15.2/MJC-8.0/sympa) with
	ESMTPS id x9D0uBCw007073
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO); 
	Sat, 12 Oct 2019 18:56:11 -0600
Received: (from root@localhost)
	by listssympa-test.colorado.edu (8.15.2/8.15.2/MJC-8.0/submit) id
	x9D0uAuP007048; Sat, 12 Oct 2019 18:56:10 -0600
Received: from CY1PR03MB2380.namprd03.prod.outlook.com (2603:10b6:a03:100::45)
	by BYAPR03MB4376.namprd03.prod.outlook.com with HTTPS via
	BYAPR08CA0032.NAMPRD08.PROD.OUTLOOK.COM; Wed, 9 Oct 2019 20:10:47 +0000
Received: from BN3PR03CA0069.namprd03.prod.outlook.com
	(2a01:111:e400:7a4d::29) by
	CY1PR03MB2380.namprd03.prod.outlook.com (2a01:111:e400:c616::6) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16;
	Wed, 9 Oct 2019 17:41:32 +0000
Received: from SN1NAM01FT026.eop-nam01.prod.protection.outlook.com
	(2a01:111:f400:7e40::203) by BN3PR03CA0069.outlook.office365.com
	(2a01:111:e400:7a4d::29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2347.16 via
	Frontend Transport; Wed, 9 Oct 2019 17:41:32 +0000
Received: from ipmx2.colorado.edu (128.138.128.232) by
	SN1NAM01FT026.mail.protection.outlook.com (10.152.65.212) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384)
	id 15.20.2347.16 via Frontend Transport; Wed, 9 Oct 2019 17:41:31 +0000
Received: from mx.colorado.edu ([128.138.128.150]) by mx.colorado.edu with
	ESMTP; 09 Oct 2019 10:57:54 -0600
Received: from mx.colorado.edu ([128.138.128.150]) by mx.colorado.edu with
	ESMTP; 09 Oct 2019 10:23:02 -0600
Received: from vger.kernel.org ([209.132.180.67]) by mx.colorado.edu with
	ESMTP; 09 Oct 2019 10:01:48 -0600
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand id
	S1731690AbfJIQBr (ORCPT <rfc822; michael.gilroy@colorado.edu>);
	Wed, 9 Oct 2019 12:01:47 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:33784 "EHLO       
	mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org 
	with ESMTP id S1730708AbfJIQBr (ORCPT       
	<rfc822; linux-kernel@vger.kernel.org>); Wed, 9 Oct 2019 12:01:47 -0400
Received: by mail-qt1-f195.google.com with SMTP id r5so4199294qtd.0;
	Wed, 09 Oct 2019 09:01:46 -0700 (PDT)
Authentication-Results: spf=none (sender IP is 128.138.128.232)
	smtp.mailfrom=vger.kernel.org; 
	o365.colorado.edu; dkim=none (message not signed)
	header.d=none; o365.colorado.edu;
	dmarc=none action=none header.from=arndb.de; 
Received-SPF: None (protection.outlook.com: vger.kernel.org does not designate
	permitted sender hosts)
IronPort-SDR: k7OQZZpn1O83KrshqvZir09zBQ7QfFwTZTFpqF5rq27V7nn+SXYUrxJGGDBZcECxvWqK1XW9ts
	IksYHBHp5A7ToBGH2H48dPAQCwU+jJinU=
IronPort-SDR: ALYc8tZo996/d01el/t1xToJ83JY0C3bGVG7rKPOwj+youDt6II15a4f/m1q5bHi19o5+wiQom
	oPklT+lFfNoBlkbInlKrwF+nu20jDizQw=
IronPort-SDR: WnQ/Zus3OQKLOLWUshGUxJILvONuloXb4s+C+BxskrcpT+7Hq95yS2YzzV2OQ5YwyxOBfCDBMw
	mEzXNesq93/WDvOiLHtsxnhyzQETAwsuU=
X-IronPort-Outbreak-Status: No, level 0, Unknown - Unknown
X-IronPort-Outbreak-Status: No, level 0, Unknown - Unknown
X-IronPort-Outbreak-Status: No, level 0, Unknown - Unknown
X-Original-Recipients: gasiewsk@o365.colorado.edu
X-Original-Recipients: migi9492@g.colorado.edu
Authentication-Results-Original: mx.colorado.edu;
	dkim=none (message not signed) header.i=none
IronPort-PHdr: =?us-ascii?q?9a23=3A3QvhzRY3bPA2z3yNlBwr/In/LSx94efdIxIV55?=
	=?us-ascii?q?w7irlHbqWk+dHYMVfC4el20gabWJWd4PVAjPDfv6emVGAdst6Ns3EHJZpLUR?=
	=?us-ascii?q?JNycAbhBcpD8PND0rnZOXrYCo3EIUKVFJs83yhd0kAHsH4alA=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0HgCwCmBZ5dh0O0hNFlHgELHIFwC4I?=
	=?us-ascii?q?bgUMyKoQjjlyBbQUdFJkXgXAUAQEBAQEBAQEBIBQBAgEBAYcRIzUIDgIDCQE?=
	=?us-ascii?q?BAQMBAQECAQUCAQECAhABAQEKCwkIKYVAhiEBAQEDAQIPEVYGCQEBCgsNAgI?=
	=?us-ascii?q?mAgIDHxIBBQEcBhMFAxqDAIILo3WBAzyLJoEyiHuBSBJ6KIwOGD6BQYEQgxM?=
	=?us-ascii?q?+h1KCWASPNJ4PgUVnapQvG3WYSy2nTzKBMQKCDk0kFGwGgjVQEBSCB44QPzO?=
	=?us-ascii?q?BBgEBk10BAQ?=
X-IPAS-Result: =?us-ascii?q?A0HgCwCmBZ5dh0O0hNFlHgELHIFwC4IbgUMyKoQjjlyBb?=
	=?us-ascii?q?QUdFJkXgXAUAQEBAQEBAQEBIBQBAgEBAYcRIzUIDgIDCQEBAQMBAQECAQUCA?=
	=?us-ascii?q?QECAhABAQEKCwkIKYVAhiEBAQEDAQIPEVYGCQEBCgsNAgImAgIDHxIBBQEcB?=
	=?us-ascii?q?hMFAxqDAIILo3WBAzyLJoEyiHuBSBJ6KIwOGD6BQYEQgxM+h1KCWASPNJ4Pg?=
	=?us-ascii?q?UVnapQvG3WYSy2nTzKBMQKCDk0kFGwGgjVQEBSCB44QPzOBBgEBk10BAQ?=
X-IronPort-AV: E=Sophos; i="5.67,276,1566885600"; d="scan'208"; a="414014031"
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1e100.net;
	s=20161025; 
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date 
	:message-id:subject:to:cc;       
	bh=ZWFHkd6ek0BtHyg9BV3fh9tCSDHEofWpBNJTTKARQwo=;       
	b=kaUhu2nWdn12oM/CzR/8uNlhivq7ptWPXCXwRV3MGgWwJR6U9CGEs7zcoDFHQLrjfM 
	RGN1nv86kty9QqzmMzZ0N2YAIUwOvwN3/InyILq43nJrkKuxeOPBTha0vhaT4Oi1XqN7 
	LQkULD5xSeQas+PY9+ar+ebSOqsDKz91t+uhqF+hqdsgyt+me9kVj3ubn2v9Mp1Pl6j9 
	izL7CG0HJTYxVVVw+u+2fQrPrONiiiTIjUIPnCsNKEfLfTArt/LUnuPp4iDhxCwau3dB 
	kDiaVq3L6dzuDx0aNcR2w+XxmlJ3/YL/u0H6M83QXyTV3Lzn/B+pwj3rYwMAIkJdmKgJ 
	IzCg==
X-Gm-Message-State: APjAAAWuhvpsq7iUgR+XO/mgZbRe/VAe3ux21SFZVYtoSmpOzo+KSft2 
	XBDxl2R31/iDGgNlD5dKynHEsbJpPWvOxWG48Co=
X-Google-Smtp-Source: APXvYqxJLyCeHAUAU1azpG4v5iXs9SXOmBMoaRvC78sbGAuHi5eUtVSvqkcf9ThEOBLk2iBn+of79sDp2hHG8oqoBW0=
X-Received: by 2002:ac8:729a:: with SMTP id v26mr4380259qto.18.1570636905814;
	Wed, 09 Oct 2019 09:01:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190918153445.1241-1-maier@linux.ibm.com>
In-Reply-To: <20190918153445.1241-1-maier@linux.ibm.com>
From: "Arnd Bergmann" <arnd@arndb.de>
Date: Wed, 9 Oct 2019 18:01:29 +0200
Message-ID: <CAK8P3a1HBog84Wvdgm1ccz1gRJRxHm8ucsxwUTTqh02gOt9WbQ@mail.gmail.com>
To: "Steffen Maier" <maier@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
X-MS-Exchange-Organization-ExpirationStartTime: 09 Oct 2019 17:41:31.8005 (UTC)
X-MS-Exchange-Organization-ExpirationStartTimeReason: OriginalSubmit
X-MS-Exchange-Organization-ExpirationInterval: 1:00:00:00.0000000
X-MS-Exchange-Organization-ExpirationIntervalReason: OriginalSubmit
X-MS-Exchange-Organization-Network-Message-Id: 09a9eade-714e-44fc-801a-08d74cdfec0e
X-EOPAttributedMessage: 0
X-MS-Exchange-Organization-MessageDirectionality: Originating
X-Forefront-Antispam-Report: CIP:128.138.128.232; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:SKN; SFS:; DIR:INB; SFP:; SCL:-1; SRVR:CY1PR03MB2380;
	H:ipmx2.colorado.edu; FPR:; SPF:None; LANG:en; ; SKIP:1; 
X-MS-Exchange-Organization-AuthSource: SN1NAM01FT026.eop-nam01.prod.protection.outlook.com
X-MS-Exchange-Organization-AuthAs: Anonymous
X-OriginatorOrg: colorado.edu
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09a9eade-714e-44fc-801a-08d74cdfec0e
X-MS-TrafficTypeDiagnostic: CY1PR03MB2380:|CY1PR03MB2380:
X-MS-Exchange-Organization-SCL: -1
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Microsoft-Antispam: BCL:0;
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2019 17:41:31.6094 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09a9eade-714e-44fc-801a-08d74cdfec0e
X-MS-Exchange-CrossTenant-Id: 3ded8b1b-070d-4629-82e4-c0b019f46057
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3ded8b1b-070d-4629-82e4-c0b019f46057;
	Ip=[128.138.128.232]; Helo=[ipmx2.colorado.edu]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR03MB2380
X-MS-Exchange-Transport-EndToEndLatency: 02:29:18.7955078
X-MS-Exchange-Processed-By-BccFoldering: 15.20.2347.014
X-Microsoft-Antispam-Mailbox-Delivery: ucf:0; jmr:0; ex:0; auth:0; dest:I;
	ENG:(750127)(520002050)(944506383)(944626516); 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aWH9fH1xkcLrsEeUaq2NfrQsqXmATQJ1fLJANXXRGe9n5Lng0xvjKHr6MqcY?=
	=?us-ascii?Q?TQ9HPVJqvO84ZvsCGh9O5+GO+fVWW/wxtgShh3IFihvA2woAIa+0qjuZjjF+?=
	=?us-ascii?Q?WUuuEX//RQpdArdN42Dig8od3jjjo9b65hSaywWZ9+PuCctTH20v5jZrRWyr?=
	=?us-ascii?Q?cF5ItTx9JCubG5s5vo9tjY6PAkNkD5aNHya2yWv4qQry5hIjoWVEOK1LQCtA?=
	=?us-ascii?Q?ANltBEzEzb27AEHFblkq8wFF1ccjbzocnfd4sv8rsWm476X7VhzNZXOA7qBq?=
	=?us-ascii?Q?BBlahNvc5DEjr8OMmRuOruodSmXJ+Qdvuxg1zB3jt83if3xeO5sju/sMyElP?=
	=?us-ascii?Q?810E5+0vbOagXUToUig5nuQ3PmLzP2XoXeLW2RROfuEpwgE4bHUUnN1YJfcP?=
	=?us-ascii?Q?UehK2mY9CNSGXQVPPOtn99hPM/yzUOor6dqGP89hQ8xF12XrLre1V1rSlCVo?=
	=?us-ascii?Q?KjEAozbDbCWHKqG9tqOsmZ9xFbDfhN8N7tHulrM7o8d9voKi/ChyXvrDHhbU?=
	=?us-ascii?Q?XrjgUibF2uiX3/YV8DrfQGxD2EDOHR/moA6k7kIaTnt/WSQQBf+8pRrDVyPL?=
	=?us-ascii?Q?B0//HdrOkaEIpVh9jbHVwo0hmR5GCg3sCqLG5CjPxnG6MkO8qokT9vLCoiru?=
	=?us-ascii?Q?Y83EUGL25NUhQa/nBbK1cci7tdKELG6JLBs9I0CMGKqr/9pQayvkRRi2yWTu?=
	=?us-ascii?Q?gzIqnt6bzZUsa6RlwS4ExUBMujE22JW0l7t6fgFyhE89u4dlokqmnMTIs+BD?=
	=?us-ascii?Q?reyV0BeY1bCrhQ25QD4oSHyWOqzGnp+b+H/y22VjQwqka7qJ1eNfbynUa6u/?=
	=?us-ascii?Q?STniLgWbvKUpMMPu1oqQvsRjLNdlEJlg/HnrPVzOtoKw8lhOM96MrdVQ4hvy?=
	=?us-ascii?Q?yg3JAmIO9pHMTOagD/DMipzAwY00xoyEvHG78px0tw0LT9A6UeuwRk/1bjNW?=
	=?us-ascii?Q?T+gNuK446BSMuZntn9gfRZz44MddFD83JbyKmr5iUtgBx+jGJK00LM2T7Lj/?=
	=?us-ascii?Q?irgfYILhd25XyorTvf/+KkovSweFRexw/FW05XS+Mi6lonCKdcTRPJRBYZ58?=
	=?us-ascii?Q?w4OQC046YE1MaESFJQGBGIlgs4/QK5bY151P7hPUKGTjg3NeLRg=3D?=
X-Greylist: Delayed for 01:47:26 by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.30]); Sun, 13 Oct 2019 02:44:02 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]);
	Sun, 13 Oct 2019 02:44:02 +0000 (UTC) for IP:'128.138.129.156'
	DOMAIN:'listssympa-test.colorado.edu'
	HELO:'listssympa-test.colorado.edu'
	FROM:'baouchiy@listssympa-test.colorado.edu' RCPT:''
X-RedHat-Spam-Score: -0.749  (HEADER_FROM_DIFFERENT_DOMAINS, MAILING_LIST_MULTI,
	SPF_HELO_NONE,
	SPF_NONE) 128.138.129.156 listssympa-test.colorado.edu 128.138.129.156
	listssympa-test.colorado.edu
	<baouchiy@listssympa-test.colorado.edu>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.30
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x9D2i6j9025387
X-loop: dm-devel@redhat.com
Cc: Vasily Gorbik <gor@linux.ibm.com>, linux-s390 <linux-s390@vger.kernel.org>,
	Benjamin Block <bblock@linux.ibm.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	linux-scsi <linux-scsi@vger.kernel.org>,
	Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>,
	"James E . J . Bottomley" <jejb@linux.ibm.com>,
	Heiko Carstens <heiko.carstens@de.ibm.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	linux-block <linux-block@vger.kernel.org>, Mauro
	Carvalho Chehab <mchehab+samsung@kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>, Linux-Next
	Mailing List <linux-next@vger.kernel.org>,
	Mark Brown <broonie@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Doug Gilbert <dgilbert@interlog.com>,
	Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Omar Sandoval <osandov@fb.com>,
	Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [dm-devel] [PATCH] compat_ioctl: fix reimplemented SG_IO
 handling causing -EINVAL from sg_io()
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Sun, 13 Oct 2019 02:47:47 +0000 (UTC)

On Wed, Sep 18, 2019 at 5:35 PM Steffen Maier <maier@linux.ibm.com> wrote:
>
> scsi_cmd_ioctl() had hdr as on stack auto variable and called
> copy_{from,to}_user with the address operator &hdr and sizeof(hdr).
>
> After the refactoring, {get,put}_sg_io_hdr() takes a pointer &hdr.
> So the copy_{from,to}_user within the new helper functions should
> just take the given pointer argument hdr and sizeof(*hdr).
>
> I saw -EINVAL from sg_io() done by /usr/lib/udev/scsi_id which could
> in turn no longer whitelist SCSI disks for devicemapper multipath.
>
> Signed-off-by: Steffen Maier <maier@linux.ibm.com>
> Fixes: 4f45155c29fd ("compat_ioctl: reimplement SG_IO handling")
> ---
>
> Arnd, I'm not sure about the sizeof(hdr32) change in the compat part in
> put_sg_io_hdr().
>
> This is for next, probably via Arnd's y2038/y2038,
> and it fixes next-20190917 for me regarding SCSI generic.

Hi Steffen,

Sorry for the long delay. I ended up not sending my pull request for
v5.4, so the bug is not there. I have now rebased my branch
on top of v5.4-rc2 and plan to send it for the v5.5 merge window.

I have folded your bugfix into my original patch, hope that's ok with
you. Tomorrow's linux-next should be fixed.

    Arnd


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
