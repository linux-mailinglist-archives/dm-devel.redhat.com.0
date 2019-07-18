Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id F07BC6D6B7
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jul 2019 00:05:48 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1784E2D1CE;
	Thu, 18 Jul 2019 22:05:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F531607C7;
	Thu, 18 Jul 2019 22:05:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 148834E590;
	Thu, 18 Jul 2019 22:05:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6IM5ON1030826 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 18 Jul 2019 18:05:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6EB7460637; Thu, 18 Jul 2019 22:05:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA53B6031D;
	Thu, 18 Jul 2019 22:05:19 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 07FAD30C1342;
	Thu, 18 Jul 2019 22:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1563487518;
	bh=P0ndy0p1hlIc8sSMEbEgCp8ktb6klmENdbkEEh5PRRE=;
	h=From:In-Reply-To:References:Date:To:Cc:From;
	b=MVddz57AxG6TcKpsTfnKWJoVuWe8MVTwrLg8VYaAD/t5wjOAjl79Q7zA4JNjMBz8F
	NuDTSizUn21rHqtXY6QdqnZhz5BEPDfXXw/IbKfc5zmVBDExtcZp1jppT4KZ9QHdKX
	so6mQWisU+ayC2rC6JcSTv0qpC8G6mYmM9NBjMfc=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20190718205308.GA65274@lobo>
References: <20190718205308.GA65274@lobo>
X-PR-Tracked-List-Id: <linux-block.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190718205308.GA65274@lobo>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git
	tags/for-5.3/dm-changes-2
X-PR-Tracked-Commit-Id: 733232f8c852bcc2ad6fc1db7f4c43eb01c7c217
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3bfe1fc46794631366faa3ef075e1b0ff7ba120a
Message-Id: <156348751828.19422.13802747332217273278.pr-tracker-bot@kernel.org>
Date: Thu, 18 Jul 2019 22:05:18 +0000
To: Mike Snitzer <snitzer@redhat.com>
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Thu, 18 Jul 2019 22:05:19 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]);
	Thu, 18 Jul 2019 22:05:19 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'pr-tracker-bot@kernel.org' RCPT:''
X-RedHat-Spam-Score: -5.101  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_PASS) 198.145.29.99 mail.kernel.org 198.145.29.99 mail.kernel.org
	<pr-tracker-bot@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.45
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: Damien Le Moal <damien.lemoal@wdc.com>,
	Nikos Tsironis <ntsironis@arrikto.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Alasdair G Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [git pull] additional device mapper changes for 5.3
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Thu, 18 Jul 2019 22:05:47 +0000 (UTC)

The pull request you sent on Thu, 18 Jul 2019 16:53:08 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git tags/for-5.3/dm-changes-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3bfe1fc46794631366faa3ef075e1b0ff7ba120a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
