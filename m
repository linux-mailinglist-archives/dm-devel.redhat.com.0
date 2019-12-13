Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 70CE411EE4E
	for <lists+dm-devel@lfdr.de>; Sat, 14 Dec 2019 00:11:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576278678;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xNqoTHjb1QwV5BeM0f0vj+q1GGms2tig0e7uqeafP+4=;
	b=LUN4Imv3QsjCXuO6wbAvL71GxaHtgkwe7SLXdfQ/Ig8arNFEEScrkWa/Cv2xaVW3zjv3Ry
	pB+uQvf8Qy1aW1yFhFcyAlnwsgcQIQiqw8xTXuarItoHTP8YP+ZYb+Ur/dH5R38OEOArwM
	Qci1oIzPkutAuWNNhT+GfgW7E1uW8tE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-zhh_h9dNPSyxl3mN-c0PaA-1; Fri, 13 Dec 2019 18:11:16 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CDF33800EB5;
	Fri, 13 Dec 2019 23:11:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B0D96364E;
	Fri, 13 Dec 2019 23:11:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C7D321809567;
	Fri, 13 Dec 2019 23:10:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBDNAQ9o032105 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 13 Dec 2019 18:10:26 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 21B0D171B40; Fri, 13 Dec 2019 23:10:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CF2D17043F
	for <dm-devel@redhat.com>; Fri, 13 Dec 2019 23:10:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 285F010163FB
	for <dm-devel@redhat.com>; Fri, 13 Dec 2019 23:10:24 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-38-9Y86FTiKNsS2dYmR4n_FLg-1; 
	Fri, 13 Dec 2019 18:10:20 -0500
From: pr-tracker-bot@kernel.org
In-Reply-To: <20191212145857.GA27301@redhat.com>
References: <20191212145857.GA27301@redhat.com>
X-PR-Tracked-List-Id: <linux-block.vger.kernel.org>
X-PR-Tracked-Message-Id: <20191212145857.GA27301@redhat.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git
	tags/for-5.5/dm-fixes
X-PR-Tracked-Commit-Id: 7fc979f8204fb763e203d3e716c17d352eb96b35
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 15da849c910da05622c75c5741dd6e176a8b6fe2
Message-Id: <157627861729.1837.4537371197446010276.pr-tracker-bot@kernel.org>
Date: Fri, 13 Dec 2019 23:10:17 +0000
To: Mike Snitzer <snitzer@redhat.com>
X-MC-Unique: 9Y86FTiKNsS2dYmR4n_FLg-1
X-MC-Unique: zhh_h9dNPSyxl3mN-c0PaA-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xBDNAQ9o032105
X-loop: dm-devel@redhat.com
Cc: Diego Calleja <diegocg@gmail.com>, Nikos Tsironis <ntsironis@arrikto.com>,
	Eric Biggers <ebiggers@google.com>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Hou Tao <houtao1@huawei.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Alasdair G Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [git pull] device mapper fixes for 5.5-rc2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The pull request you sent on Thu, 12 Dec 2019 09:58:57 -0500:

> git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git tags/for-5.5/dm-fixes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/15da849c910da05622c75c5741dd6e176a8b6fe2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

