Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAFA25915
	for <lists+dm-devel@lfdr.de>; Tue, 21 May 2019 22:39:55 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CD57AC05FBD7;
	Tue, 21 May 2019 20:39:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 109687A4D1;
	Tue, 21 May 2019 20:39:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8BB1E1833004;
	Tue, 21 May 2019 20:39:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4GNPn5E004172 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 16 May 2019 19:25:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 05D7079419; Thu, 16 May 2019 23:25:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4915D5D6A9;
	Thu, 16 May 2019 23:25:44 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B8E61307D84F;
	Thu, 16 May 2019 23:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1558049131;
	bh=8uRYp6pF0xgw/fgOpelAIxQ5hZa7qN5mdNQ2Ep68veo=;
	h=From:In-Reply-To:References:Date:To:Cc:From;
	b=teBqSSkbmrH4af/C/VSfxKpbzcDXcDt5cVEyvgW5nxFPBW2tawt6bl349STGtqISL
	G0XjZZEDEOX3uNxZmVOYAMOlP5qRdf0FulduNz910U6mNF/NW7OBgU/Ldt2SMuUV3S
	qxXrIql6voLOafqE5KY2w0/k+l9NosG4x+0iiE9Q=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20190516143206.GA16368@lobo>
References: <20190513185948.GA26710@redhat.com> <20190516143206.GA16368@lobo>
X-PR-Tracked-List-Id: <linux-block.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190516143206.GA16368@lobo>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git
	tags/for-5.2/dm-changes-v2
X-PR-Tracked-Commit-Id: 8454fca4f53bbe5e0a71613192674c8ce5c52318
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 311f71281ff4b24f86a39c60c959f485c68a6d36
Message-Id: <155804913094.14244.4308114344731796324.pr-tracker-bot@kernel.org>
Date: Thu, 16 May 2019 23:25:30 +0000
To: Mike Snitzer <snitzer@redhat.com>
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Thu, 16 May 2019 23:25:39 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Thu, 16 May 2019 23:25:39 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'pr-tracker-bot@kernel.org' RCPT:''
X-RedHat-Spam-Score: -5.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_HI) 198.145.29.99 mail.kernel.org
	198.145.29.99 mail.kernel.org <pr-tracker-bot@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 21 May 2019 16:38:42 -0400
Cc: Damien Le Moal <damien.lemoal@wdc.com>, YueHaibing <yuehaibing@huawei.com>,
	Mike Snitzer <snitzer@redhat.com>, Huaisheng Ye <yehs1@lenovo.com>,
	Nikos Tsironis <ntsironis@arrikto.com>, Peng Wang <rocking@whu.edu.cn>,
	Helen Koike <helen.koike@collabora.com>,
	Martin Wilck <mwilck@suse.com>, linux-block@vger.kernel.org,
	Milan Broz <gmazyland@gmail.com>, dm-devel@redhat.com,
	Mikulas Patocka <mpatocka@redhat.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Sheetal Singala <2396sheetal@gmail.com>,
	Colin Ian King <colin.king@canonical.com>, Yufen Yu <yuyufen@huawei.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, Alasdair G Kergon <agk@redhat.com>,
	Bryan Gurney <bgurney@redhat.com>
Subject: Re: [dm-devel] [git pull v2] device mapper changes for 5.2
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Tue, 21 May 2019 20:39:48 +0000 (UTC)

The pull request you sent on Thu, 16 May 2019 10:32:07 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git tags/for-5.2/dm-changes-v2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/311f71281ff4b24f86a39c60c959f485c68a6d36

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
