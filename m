Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id BC15335FCA6
	for <lists+dm-devel@lfdr.de>; Wed, 14 Apr 2021 22:26:38 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-P3s1pGdQO-6sMXmSoCk3TA-1; Wed, 14 Apr 2021 16:26:35 -0400
X-MC-Unique: P3s1pGdQO-6sMXmSoCk3TA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E80328030D6;
	Wed, 14 Apr 2021 20:26:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4AFFE6087C;
	Wed, 14 Apr 2021 20:26:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E8536CF70;
	Wed, 14 Apr 2021 20:26:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13EKPxHw013415 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 14 Apr 2021 16:25:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E748821C860E; Wed, 14 Apr 2021 20:25:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E22FE2052DA9
	for <dm-devel@redhat.com>; Wed, 14 Apr 2021 20:25:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D9935100E644
	for <dm-devel@redhat.com>; Wed, 14 Apr 2021 20:25:55 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-357-34-obH8yNLOHYTyMVQRvag-1;
	Wed, 14 Apr 2021 16:25:53 -0400
X-MC-Unique: 34-obH8yNLOHYTyMVQRvag-1
Received: by mail.kernel.org (Postfix) with ESMTPS id 3A7FE6044F;
	Wed, 14 Apr 2021 20:25:52 +0000 (UTC)
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain
	[127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id
	2ABAB60CD1; Wed, 14 Apr 2021 20:25:52 +0000 (UTC)
From: pr-tracker-bot@kernel.org
In-Reply-To: <20210414184007.GA8824@redhat.com>
References: <20210414184007.GA8824@redhat.com>
X-PR-Tracked-List-Id: <linux-block.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210414184007.GA8824@redhat.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git
	tags/for-5.12/dm-fixes-3
X-PR-Tracked-Commit-Id: 8ca7cab82bda4eb0b8064befeeeaa38106cac637
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7f75285ca572eaabc028cf78c6ab5473d0d160be
Message-Id: <161843195211.17968.8724252519934154319.pr-tracker-bot@kernel.org>
Date: Wed, 14 Apr 2021 20:25:52 +0000
To: Mike Snitzer <snitzer@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Jaegeuk Kim <jaegeuk@google.com>, Alasdair G Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [git pull] device mapper fix for 5.12 final
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The pull request you sent on Wed, 14 Apr 2021 14:40:07 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git tags/for-5.12/dm-fixes-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7f75285ca572eaabc028cf78c6ab5473d0d160be

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

