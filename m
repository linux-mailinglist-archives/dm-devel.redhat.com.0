Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 703927210A0
	for <lists+dm-devel@lfdr.de>; Sat,  3 Jun 2023 16:53:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685804006;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4KLeEDU8PgvFW8qk1CwqYyjlBnKAcuWzr66tXWB3tBk=;
	b=HAIvrMo9oGHjt3XJBDSB1w6VV2bRLciJv2ctBUsX3TYNifGKxrk9mwKu1mLg9xUmVu5JaR
	2ddimqicmJtZDpl3EV5BMN6VJgKdUBgeBGASBvSLyPcpfQCMe4c3R8jpaSFNxy+j3V/2h/
	OjM3QW9qEqfLRycYzQwdiTo+OLr59oc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-164-A7ZIjlJ0OBSkNd_roCjE5Q-1; Sat, 03 Jun 2023 10:53:24 -0400
X-MC-Unique: A7ZIjlJ0OBSkNd_roCjE5Q-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B0B4185A78E;
	Sat,  3 Jun 2023 14:53:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4F4F24A927E;
	Sat,  3 Jun 2023 14:53:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id AE1F51946A41;
	Sat,  3 Jun 2023 14:53:17 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 0AE791946595
 for <dm-devel@listman.corp.redhat.com>; Sat,  3 Jun 2023 14:53:15 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9E97AC154D9; Sat,  3 Jun 2023 14:53:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E0BEC154D7
 for <dm-devel@redhat.com>; Sat,  3 Jun 2023 14:53:15 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 620A885A5A8
 for <dm-devel@redhat.com>; Sat,  3 Jun 2023 14:53:15 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-XxmaU52ZM8C8EorcxhOy4w-1; Sat, 03 Jun 2023 10:53:11 -0400
X-MC-Unique: XxmaU52ZM8C8EorcxhOy4w-1
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 00C155C00CE;
 Sat,  3 Jun 2023 10:53:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Sat, 03 Jun 2023 10:53:09 -0400
X-ME-Sender: <xms:1FN7ZHNkI96pAi3U8oJryJMbMVD7qbXmBORwMK9wkJ75pZ60LXG58A>
 <xme:1FN7ZB8zS_0cZnWj0GCKnfwGnJBHgWrQwY7DMp_n0od0Ib1dEA94o-CasVdbe7Vcv
 F-_1ECPL3e9bHk>
X-ME-Received: <xmr:1FN7ZGT25mJAUswA6-WbvwV3mjJ7xmgkd2MMZ7MLLtSNlC1MV_c7toz6VgDSn2tQxvVUOsjWhyI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeelhedgkedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepffgvmhhi
 ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
 hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepjeffjefggfeugeduvedvjeekgfeh
 gffhhfffjeetkeelueefffetfffhtdduheetnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
 lhgrsgdrtghomh
X-ME-Proxy: <xmx:1FN7ZLssyL5GUT9C5kfCxPGVqhz6ZN848vS6BeLBNenuxpSy0hjZng>
 <xmx:1FN7ZPfRErbm921ZJx60OzCDsuqn0L-yJLQsEnsWAPKnFHwfeq5DiQ>
 <xmx:1FN7ZH3sQbEesb-FYB7OpP8jZSBkSVR6nxPfc4xrOEHvg-5-LiU_XQ>
 <xmx:1FN7ZAqHU6f3IlSLmOHO9xQk1KT4gAOag9YzY1UXPDgK2sbsBQFaNQ>
Feedback-ID: iac594737:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 3 Jun 2023 10:53:08 -0400 (EDT)
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 dm-devel@redhat.com
Date: Sat,  3 Jun 2023 10:52:38 -0400
Message-Id: <20230603145244.1538-1-demi@invisiblethingslab.com>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [dm-devel] [PATCH v2 0/6] Several device-mapper fixes
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: invisiblethingslab.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series contains several miscellaneous fixes to input validation in
device-mapper.  The only potentially controversial commits should be the
last two, which prevent creating devices named ".", "..", or "control".
The other patches fix input validation problems that have existed since
at least the beginning of git history.

Changes since v1:

- Fix silly mistake (using sizeof() on a pointer) caught by 0day bot.

Demi Marie Obenour (6):
  device-mapper: Check that target specs are sufficiently aligned
  device-mapper: Avoid pointer arithmetic overflow
  device-mapper: structs and parameter strings must not overlap
  device-mapper: Avoid double-fetch of version
  device-mapper: Refuse to create device named "control"
  device-mapper: "." and ".." are not valid symlink names

 drivers/md/dm-ioctl.c | 91 ++++++++++++++++++++++++++++++++++---------
 1 file changed, 72 insertions(+), 19 deletions(-)

-- 
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

