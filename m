Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 2681919E0A5
	for <lists+dm-devel@lfdr.de>; Sat,  4 Apr 2020 00:05:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585951549;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=aqWQbs6sxOOzmo0fzPwIKgODCIepSFQCZ/0pJ/D6kqo=;
	b=YCLHjH6c2rmlkg1bfUoLGJf1t8jSo+JfwpwGrKmVRFjUZemdqRt1KrzL9nVxv8FOMX1so3
	8lKYQNJwSRuYk/B+nmQd4TwuFNKwSdHFe3Y9z3l/UbNGUfKtMLgegmbMGIuaU58t/VcrXo
	LJuclqJbuCXjnNEHBfptnLvkfpO6G5g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-b_ORcTqLPxiL7KgDmuL8TQ-1; Fri, 03 Apr 2020 18:05:46 -0400
X-MC-Unique: b_ORcTqLPxiL7KgDmuL8TQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 09A8C13F8;
	Fri,  3 Apr 2020 22:05:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 51143B19A4;
	Fri,  3 Apr 2020 22:05:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3E97E1809567;
	Fri,  3 Apr 2020 22:05:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 033M5QKe021425 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 3 Apr 2020 18:05:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2FFB62022EA4; Fri,  3 Apr 2020 22:05:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BBFA2022EB3
	for <dm-devel@redhat.com>; Fri,  3 Apr 2020 22:05:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0687B101A55D
	for <dm-devel@redhat.com>; Fri,  3 Apr 2020 22:05:24 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-422-FZfBv98fMoKCcmCuBBuiAQ-1;
	Fri, 03 Apr 2020 18:05:19 -0400
X-MC-Unique: FZfBv98fMoKCcmCuBBuiAQ-1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200403154213.GA18386@redhat.com>
References: <20200403154213.GA18386@redhat.com>
X-PR-Tracked-List-Id: <linux-block.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200403154213.GA18386@redhat.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git
	tags/for-5.7/dm-fixes
X-PR-Tracked-Commit-Id: 120c9257f5f19e5d1e87efcbb5531b7cd81b7d74
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8267d8fb4819afa76b2a54dca48efdda6f0b1910
Message-Id: <158595151814.22871.4596476609800873653.pr-tracker-bot@kernel.org>
Date: Fri, 03 Apr 2020 22:05:18 +0000
To: Mike Snitzer <snitzer@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 033M5QKe021425
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Alasdair G Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [git pull] device mapper fixes for 5.7
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The pull request you sent on Fri, 3 Apr 2020 11:42:13 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git tags/for-5.7/dm-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8267d8fb4819afa76b2a54dca48efdda6f0b1910

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

