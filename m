Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 811821C0B1E
	for <lists+dm-devel@lfdr.de>; Fri,  1 May 2020 01:50:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588290658;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ACOC2lL4+3meesmlNzZll1jMI0p0X1dv7mTf95veLCE=;
	b=VxMnpPAuwg2nK9ZC73F09rCCv5IusTZwcfECzgshBg8alCxvZj2XHm988H9G8u3cngAiMr
	6lDsbNlkjrFCx+ID/mvt0SGbeJ/bM/ieUeSQVt/87jUiRfNjzLvF6Oi4WcQYsTDs8JUFoP
	xkkWU/p1KkReGAXFBdhJBKRBM5bBp/o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-I-DaAuo8M4WW2S2N0Cjpcg-1; Thu, 30 Apr 2020 19:50:56 -0400
X-MC-Unique: I-DaAuo8M4WW2S2N0Cjpcg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D3AB18FE861;
	Thu, 30 Apr 2020 23:50:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DA79605CF;
	Thu, 30 Apr 2020 23:50:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D59E81809542;
	Thu, 30 Apr 2020 23:50:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03UNoOx0013285 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 30 Apr 2020 19:50:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9E2CC202696B; Thu, 30 Apr 2020 23:50:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A9632026D69
	for <dm-devel@redhat.com>; Thu, 30 Apr 2020 23:50:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F8F2186E3A1
	for <dm-devel@redhat.com>; Thu, 30 Apr 2020 23:50:21 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-44-lTMNpEY0OP2kwQcdgBKO5w-1; 
	Thu, 30 Apr 2020 19:50:17 -0400
X-MC-Unique: lTMNpEY0OP2kwQcdgBKO5w-1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200430220735.GA30584@redhat.com>
References: <20200430220735.GA30584@redhat.com>
X-PR-Tracked-List-Id: <linux-block.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200430220735.GA30584@redhat.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git
	tags/for-5.7/dm-fixes-2
X-PR-Tracked-Commit-Id: 5686dee34dbfe0238c0274e0454fa0174ac0a57a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c45e8bccecaf633480d378daff11e122dfd5e96d
Message-Id: <158829061518.2910.6523630144003020969.pr-tracker-bot@kernel.org>
Date: Thu, 30 Apr 2020 23:50:15 +0000
To: Mike Snitzer <snitzer@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03UNoOx0013285
X-loop: dm-devel@redhat.com
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>,
	Sunwook Eom <speed.eom@samsung.com>,
	Gabriel Krisman Bertazi <krisman@collabora.com>,
	Milan Broz <gmazyland@gmail.com>, Alasdair G Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [git pull] device mapper fixes for 5.7-rc4
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
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The pull request you sent on Thu, 30 Apr 2020 18:07:36 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git tags/for-5.7/dm-fixes-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c45e8bccecaf633480d378daff11e122dfd5e96d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

