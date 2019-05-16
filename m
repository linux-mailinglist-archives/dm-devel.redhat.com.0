Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id CE49025914
	for <lists+dm-devel@lfdr.de>; Tue, 21 May 2019 22:39:41 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 49E7C30917AB;
	Tue, 21 May 2019 20:39:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E9EE541C1;
	Tue, 21 May 2019 20:39:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8823F1833002;
	Tue, 21 May 2019 20:39:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4GNPjtG004166 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 16 May 2019 19:25:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 87EFE611B2; Thu, 16 May 2019 23:25:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6ECD4611AA;
	Thu, 16 May 2019 23:25:40 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 31E843082E09;
	Thu, 16 May 2019 23:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1558049129;
	bh=a33eXdoPIV/rf1hMVq8mNzabQygu7Xb65PrKTrkKtuU=;
	h=From:In-Reply-To:References:Date:To:Cc:From;
	b=GRUnnM2Jl9UsSqcHiQohR2TCW/nxF0uH573PnlLWsrNx60dgJ/qaEGp9YwGsGg8Vy
	Xlv+Ac4MD1RX8EX+roFU0XTtWn6yozTGfKiLafoFozBeWdK+zGXHaCEzHmLnTJ2Tuc
	xeC0WMzlmcMSwFoeUEL/dIz0jIappqVQHbevSRfM=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20190513185948.GA26710@redhat.com>
References: <20190513185948.GA26710@redhat.com>
X-PR-Tracked-List-Id: <linux-block.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190513185948.GA26710@redhat.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git
	tags/for-5.2/dm-changes
X-PR-Tracked-Commit-Id: 05d6909ea9d62bb357846177a84842e09fc15914
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0f41fcf78849c902ddca564f99a8e23ccfc80333
Message-Id: <155804912958.14244.15621348004778223895.pr-tracker-bot@kernel.org>
Date: Thu, 16 May 2019 23:25:29 +0000
To: Mike Snitzer <snitzer@redhat.com>
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Thu, 16 May 2019 23:25:30 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]);
	Thu, 16 May 2019 23:25:30 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'pr-tracker-bot@kernel.org' RCPT:''
X-RedHat-Spam-Score: -5.099  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_NONE) 198.145.29.99 mail.kernel.org 198.145.29.99 mail.kernel.org
	<pr-tracker-bot@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.46
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 21 May 2019 16:38:42 -0400
Cc: Damien Le Moal <damien.lemoal@wdc.com>, YueHaibing <yuehaibing@huawei.com>,
	Mike Snitzer <snitzer@redhat.com>, Huaisheng Ye <yehs1@lenovo.com>,
	Nikos Tsironis <ntsironis@arrikto.com>, Peng Wang <rocking@whu.edu.cn>,
	Helen Koike <helen.koike@collabora.com>,
	Martin Wilck <mwilck@suse.com>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Colin Ian King <colin.king@canonical.com>, Yufen Yu <yuyufen@huawei.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>, Alasdair G Kergon <agk@redhat.com>,
	Bryan Gurney <bgurney@redhat.com>
Subject: Re: [dm-devel] [git pull] device mapper changes for 5.2
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Tue, 21 May 2019 20:39:40 +0000 (UTC)

The pull request you sent on Mon, 13 May 2019 14:59:48 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git tags/for-5.2/dm-changes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0f41fcf78849c902ddca564f99a8e23ccfc80333

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
