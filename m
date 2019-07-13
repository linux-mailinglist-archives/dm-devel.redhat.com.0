Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D466467C51
	for <lists+dm-devel@lfdr.de>; Sun, 14 Jul 2019 00:51:06 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C153A3082201;
	Sat, 13 Jul 2019 22:51:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0176D19489;
	Sat, 13 Jul 2019 22:50:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9445918184A4;
	Sat, 13 Jul 2019 22:50:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6DMoLUn021176 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 13 Jul 2019 18:50:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E61EA60C05; Sat, 13 Jul 2019 22:50:21 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F2DE60BE5;
	Sat, 13 Jul 2019 22:50:17 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CE129308FC4E;
	Sat, 13 Jul 2019 22:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1563058216;
	bh=FfiFRhcVo3oHTyWaTbBKiAFRixfEwAnHsSXqaE/zfg4=;
	h=From:In-Reply-To:References:Date:To:Cc:From;
	b=HtPqjgxJKOeTRlynD8IH1QZE9q+GpmCLynhpJpOoxYgA1POv8NyvwGDMkmXPUIieK
	cXiJBZ6tMw251WjXErEqGqT3TFUrnnVlXjYtzAmb2fFzq/piNqle0z25gLB0dQtbLP
	MJ2GwLe9k68OJ8iRnryubCEDYaDHuGNk5vWQqckU=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20190712190552.GA52544@lobo>
References: <20190712190552.GA52544@lobo>
X-PR-Tracked-List-Id: <linux-block.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190712190552.GA52544@lobo>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git
	tags/for-5.3/dm-changes
X-PR-Tracked-Commit-Id: bd293d071ffe65e645b4d8104f9d8fe15ea13862
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2260840592fbed5be98ca03c97eb8172941f27ac
Message-Id: <156305821635.12932.3973331384786871643.pr-tracker-bot@kernel.org>
Date: Sat, 13 Jul 2019 22:50:16 +0000
To: Mike Snitzer <snitzer@redhat.com>
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Sat, 13 Jul 2019 22:50:16 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Sat, 13 Jul 2019 22:50:16 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'pr-tracker-bot@kernel.org' RCPT:''
X-RedHat-Spam-Score: -5.101  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_PASS) 198.145.29.99 mail.kernel.org 198.145.29.99 mail.kernel.org
	<pr-tracker-bot@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: Pavel Begunkov <asml.silence@gmail.com>,
	Zhengyuan Liu <liuzhengyuan@kylinos.cn>,
	Junxiao Bi <junxiao.bi@oracle.com>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Qu Wenruo <wqu@suse.com>,
	Fuqian Huang <huangfq.daxian@gmail.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Milan Broz <gmazyland@gmail.com>, Alasdair G Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [git pull] device mapper changes for 5.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Sat, 13 Jul 2019 22:51:05 +0000 (UTC)

The pull request you sent on Fri, 12 Jul 2019 15:05:52 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git tags/for-5.3/dm-changes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2260840592fbed5be98ca03c97eb8172941f27ac

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
