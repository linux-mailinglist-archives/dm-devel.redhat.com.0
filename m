Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9ED671095DE
	for <lists+dm-devel@lfdr.de>; Mon, 25 Nov 2019 23:54:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574722474;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ffUrhQXnClUyXk3osvcASIjRncdxWxzkz6U/Ke2JNUU=;
	b=MRuq1+jLVniQjO/fDM1SefUl+g9C8O4RL3n/dYLnnw1AxttHWtHxKhzt8Z6eUdN9S6W4RG
	x6IarOELO/F3dfi6dt0p3vA7dsRO+clufLaEmpZX4E8aI4pvwL8I2DGHr2tMyVwdFR7sVz
	rOp0cR0gJ9rAvP1mmPm4L1ZrIW4gWQs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-F2wEQNBDMLaqu2ck4GotFg-1; Mon, 25 Nov 2019 17:54:31 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46E41802CB4;
	Mon, 25 Nov 2019 22:54:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6384D608B8;
	Mon, 25 Nov 2019 22:54:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0F81E4BB65;
	Mon, 25 Nov 2019 22:54:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAPMrp3Q006728 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 25 Nov 2019 17:53:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5D6542038B96; Mon, 25 Nov 2019 22:53:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 596F12026D68
	for <dm-devel@redhat.com>; Mon, 25 Nov 2019 22:53:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 042ED801FD4
	for <dm-devel@redhat.com>; Mon, 25 Nov 2019 22:53:49 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-5-XbzE6ibRNPaBi8LDirWC8A-1;
	Mon, 25 Nov 2019 17:53:47 -0500
From: pr-tracker-bot@kernel.org
In-Reply-To: <20191122153747.GA23143@redhat.com>
References: <20191122153747.GA23143@redhat.com>
X-PR-Tracked-List-Id: <linux-block.vger.kernel.org>
X-PR-Tracked-Message-Id: <20191122153747.GA23143@redhat.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git
	tags/for-5.5/dm-changes
X-PR-Tracked-Commit-Id: f612b2132db529feac4f965f28a1b9258ea7c22b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: eeee2827ae75ca58a6965e1b6d208576a5a01920
Message-Id: <157472191073.22729.17157564640043635383.pr-tracker-bot@kernel.org>
Date: Mon, 25 Nov 2019 22:45:10 +0000
To: Mike Snitzer <snitzer@redhat.com>
X-MC-Unique: XbzE6ibRNPaBi8LDirWC8A-1
X-MC-Unique: F2wEQNBDMLaqu2ck4GotFg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAPMrp3Q006728
X-loop: dm-devel@redhat.com
Cc: Nikos Tsironis <ntsironis@arrikto.com>,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	Dmitry Fomichev <dmitry.fomichev@wdc.com>,
	Heinz Mauelshagen <heinzm@redhat.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Mikulas Patocka <mpatocka@redhat.com>,
	Jeffle Xu <jefflexu@linux.alibaba.com>,
	Nathan Chancellor <natechancellor@gmail.com>,
	Maged Mokhtar <mmokhtar@petasan.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Alasdair G Kergon <agk@redhat.com>, Bryan Gurney <bgurney@redhat.com>
Subject: Re: [dm-devel] [git pull] device mapper changes for 5.5
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The pull request you sent on Fri, 22 Nov 2019 10:37:47 -0500:

> git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git tags/for-5.5/dm-changes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/eeee2827ae75ca58a6965e1b6d208576a5a01920

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

