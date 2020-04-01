Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id DBD7D19B88A
	for <lists+dm-devel@lfdr.de>; Thu,  2 Apr 2020 00:38:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585780710;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=eg6smiGW61xpT0MBU0W/syNstr9hkG47y/57HjQsPio=;
	b=f92uopsdT1XMEGVOYVJlfapyhy/AjAZH+zkyi1p71xjvBzi0Av5IDnwSainxnNqILDcABA
	RlfuzoJPrttNqFAGm2Cu0h3RiPhHE8Bvzu1UVWwQpUFGCFx7zycOI91LTVDvqPE4Tk7w1Z
	29B32WLnrxBnexVv8YfpVHpXFuvZCoE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-iOvq7W-NM_CzdTVQ1YVWcQ-1; Wed, 01 Apr 2020 18:38:28 -0400
X-MC-Unique: iOvq7W-NM_CzdTVQ1YVWcQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 419E513F6;
	Wed,  1 Apr 2020 22:38:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D734560BE2;
	Wed,  1 Apr 2020 22:38:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 66B7C18095FF;
	Wed,  1 Apr 2020 22:38:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 031MZT8Q009092 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 1 Apr 2020 18:35:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 09DE22022EB3; Wed,  1 Apr 2020 22:35:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 062A62022EB1
	for <dm-devel@redhat.com>; Wed,  1 Apr 2020 22:35:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD54D8F8435
	for <dm-devel@redhat.com>; Wed,  1 Apr 2020 22:35:26 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-382-VsgTngqOO3-QPwdXGBKHtQ-1;
	Wed, 01 Apr 2020 18:35:24 -0400
X-MC-Unique: VsgTngqOO3-QPwdXGBKHtQ-1
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200401165628.GA22107@redhat.com>
References: <20200401165628.GA22107@redhat.com>
X-PR-Tracked-List-Id: <linux-block.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200401165628.GA22107@redhat.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git
	tags/for-5.7/dm-changes
X-PR-Tracked-Commit-Id: 81d5553d1288c2ec0390f02f84d71ca0f0f9f137
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ffc1c20c46f74e24c3f03147688b4af6e429654a
Message-Id: <158578052225.24680.1741801346035155894.pr-tracker-bot@kernel.org>
Date: Wed, 01 Apr 2020 22:35:22 +0000
To: Mike Snitzer <snitzer@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 031MZT8Q009092
X-loop: dm-devel@redhat.com
Cc: Nikos Tsironis <ntsironis@arrikto.com>, Erich Eckner <git@eckner.net>,
	Bob Liu <bob.liu@oracle.com>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Harshini X Shetty <Harshini.X.Shetty@sony.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Alasdair G Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [git pull] device mapper changes for 5.7
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The pull request you sent on Wed, 1 Apr 2020 12:57:54 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git tags/for-5.7/dm-changes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ffc1c20c46f74e24c3f03147688b4af6e429654a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

