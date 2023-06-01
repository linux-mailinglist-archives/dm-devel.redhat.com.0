Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A1171F4B0
	for <lists+dm-devel@lfdr.de>; Thu,  1 Jun 2023 23:31:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685655073;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qGDMANYIKAZ2Z4btJ+KgLdlKdGRh+GJG8AOyi37zRGM=;
	b=Bg7tOCUFbsANeyyX7u4Ksj9LIAGrBdaQoP8LTnz63ogaHo7a7baTeQQO4X5zv/daJozD1e
	4RWo3Ic0cELqptIyLltw8E5cDdSKNjiFTOqucDQQissha6DWFev+F0MEI6jOjvxU3yZV4Q
	XS/bQic+Gnpylu/4mohw5PDXdt4Vw04=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-500-k3pr7a53NmW4sK7JAq3BFg-1; Thu, 01 Jun 2023 17:31:11 -0400
X-MC-Unique: k3pr7a53NmW4sK7JAq3BFg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3927F293248A;
	Thu,  1 Jun 2023 21:31:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 59ABD48205E;
	Thu,  1 Jun 2023 21:31:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3C72B19466DF;
	Thu,  1 Jun 2023 21:31:04 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A7447194658C
 for <dm-devel@listman.corp.redhat.com>; Thu,  1 Jun 2023 21:31:03 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 93F5E202696C; Thu,  1 Jun 2023 21:31:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8C8F22029F6D
 for <dm-devel@redhat.com>; Thu,  1 Jun 2023 21:31:03 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7245838149A2
 for <dm-devel@redhat.com>; Thu,  1 Jun 2023 21:31:03 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-604-6VtjFLt3MaGW-LqA-7V1tA-1; Thu, 01 Jun 2023 17:31:02 -0400
X-MC-Unique: 6VtjFLt3MaGW-LqA-7V1tA-1
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 1827B5C01D9;
 Thu,  1 Jun 2023 17:25:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 01 Jun 2023 17:25:24 -0400
X-ME-Sender: <xms:wwx5ZN-1nVIOm-poAfwY9drGrP90YJr5LpDKtQC7y0V1wVqOEYF2nA>
 <xme:wwx5ZBvmFjIoi_nEYkSHx4SoUgCEPCj5JjzzcatwrTOK9fa3MSU7SUicVzOfNeewF
 waFfYuhoSjT7ZE>
X-ME-Received: <xmr:wwx5ZLCTwGhQvoIACKWGpOIxAADgTa98P88Cz2-F86hbwBliEpBaJSG_lXwozkbcuhGdXiGEa_I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeluddgudeiudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeffvghm
 ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
 hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeejffejgffgueegudevvdejkefg
 hefghffhffejteekleeufeffteffhfdtudehteenucevlhhushhtvghrufhiiigvpedune
 curfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhg
 shhlrggsrdgtohhm
X-ME-Proxy: <xmx:wwx5ZBdu0qnky4yPi8iZRFNjfK0r4M2LhhyDSGerNQOK36XFPeGGJA>
 <xmx:wwx5ZCNO-Qh9kG24AtB4r0wKEVfpVCo8avynWEOLTvq3v27efeUSKA>
 <xmx:wwx5ZDlThLHPAN4DdI1yz7fhhxtS3qwq8COBRROqtcR1yY02SWmdhw>
 <xmx:xAx5ZLbchMSSD7_LbgR_uT6c8M0LsdGIxZ-a370F4lDPGenGDUjQEA>
Feedback-ID: iac594737:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Jun 2023 17:25:23 -0400 (EDT)
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 dm-devel@redhat.com
Date: Thu,  1 Jun 2023 17:24:55 -0400
Message-Id: <20230601212456.1533-7-demi@invisiblethingslab.com>
In-Reply-To: <20230601212456.1533-1-demi@invisiblethingslab.com>
References: <20230601212456.1533-1-demi@invisiblethingslab.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [dm-devel] [PATCH 6/6] device-mapper: "." and ".." are not valid
 symlink names
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
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
 linux-kernel@vger.kernel.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: invisiblethingslab.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Using either of these is going to greatly confuse userspace, as they are
not valid symlink names and so creating the usual /dev/mapper/NAME
symlink will not be possible.  As creating a device with either of these
names is almost certainly a userspace bug, just error out.

Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
---
 drivers/md/dm-ioctl.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/md/dm-ioctl.c b/drivers/md/dm-ioctl.c
index b12592bcb4b2b8513f5da6208fb545203534d7ff..adf0c4becc743e4ad59e1d6b0ef108ddd56f207d 100644
--- a/drivers/md/dm-ioctl.c
+++ b/drivers/md/dm-ioctl.c
@@ -771,8 +771,10 @@ static int check_name(const char *name)
 		return -EINVAL;
 	}
 
-	if (strcmp(name, DM_CONTROL_NODE) == 0) {
-		DMERR("device name cannot be \"%s\"", DM_CONTROL_NODE);
+	if (strcmp(name, DM_CONTROL_NODE) == 0 ||
+	    strcmp(name, ".") == 0 ||
+	    strcmp(name, "..") == 0) {
+		DMERR("device name cannot be \"%s\", \".\", or \"..\"", DM_CONTROL_NODE);
 		return -EINVAL;
 	}
 
-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

