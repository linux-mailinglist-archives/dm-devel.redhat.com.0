Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 64855B9F5E
	for <lists+dm-devel@lfdr.de>; Sat, 21 Sep 2019 20:18:56 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DFA39C058CBD;
	Sat, 21 Sep 2019 18:18:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DB69608A5;
	Sat, 21 Sep 2019 18:18:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7C6824E589;
	Sat, 21 Sep 2019 18:18:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8LIFfxS027044 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 21 Sep 2019 14:15:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3EC8E5F716; Sat, 21 Sep 2019 18:15:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx26.extmail.prod.ext.phx2.redhat.com
	[10.5.110.67])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D82555C21F;
	Sat, 21 Sep 2019 18:15:35 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0998C8980FA;
	Sat, 21 Sep 2019 18:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1569089734;
	bh=twTGq0/ZKKaB7MuhBMbge4Oly6HGwraWRm+5aMfqSjo=;
	h=From:In-Reply-To:References:Date:To:Cc:From;
	b=YcEoMAqsS/lnAtGLS4qAx1a8ZSn6qONnwvFip8p/WrxbgPEjOIghKAXHzKZuwui/S
	Pp92pVj2sLPVfanyh+N/9+1BW9UvxdKQThBVvByVSb7t/LsfhdCwk8LIrUcq0im+1K
	0gbhWWl7BfRbxfQo8EPryDu9pwNjx9ALOY7q0n/8=
From: pr-tracker-bot@kernel.org
In-Reply-To: <20190919211923.GA16508@redhat.com>
References: <20190919211923.GA16508@redhat.com>
X-PR-Tracked-List-Id: <linux-block.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190919211923.GA16508@redhat.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git
	tags/for-5.4/dm-changes
X-PR-Tracked-Commit-Id: afa179eb603847494aa5061d4f501224a30dd187
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3e414b5bd28f965fb39b9e9419d877df0cf3111a
Message-Id: <156908973452.32474.7118884566596438956.pr-tracker-bot@kernel.org>
Date: Sat, 21 Sep 2019 18:15:34 +0000
To: Mike Snitzer <snitzer@redhat.com>
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.67]);
	Sat, 21 Sep 2019 18:15:35 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.67]);
	Sat, 21 Sep 2019 18:15:35 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'pr-tracker-bot@kernel.org' RCPT:''
X-RedHat-Spam-Score: -5.101  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_PASS) 198.145.29.99 mail.kernel.org 198.145.29.99 mail.kernel.org
	<pr-tracker-bot@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.67
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: Nikos Tsironis <ntsironis@arrikto.com>, Huaisheng Ye <yehs1@lenovo.com>,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	ZhangXiaoxu <zhangxiaoxu5@huawei.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Alasdair G Kergon <agk@redhat.com>,
	Jaskaran Khurana <jaskarankhurana@linux.microsoft.com>
Subject: Re: [dm-devel] [git pull] device mapper changes for 5.4
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Sat, 21 Sep 2019 18:18:54 +0000 (UTC)

The pull request you sent on Thu, 19 Sep 2019 17:19:24 -0400:

> git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git tags/for-5.4/dm-changes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3e414b5bd28f965fb39b9e9419d877df0cf3111a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
