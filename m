Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 3C16314D585
	for <lists+dm-devel@lfdr.de>; Thu, 30 Jan 2020 05:16:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580357768;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VsXOWmAQv23fjTSnLb3TO6/yQb32ytNjhZGDH0gmf2E=;
	b=ZMgOW1hmKuwu1Lk5+oAPeciwc++d3KfCIORLV1dq2Azu9CKBiP/rArc5HW3xegdzmG37bO
	7F9Zy4GIv/OoQbBbcNuGd9UiUd+PiQ8j4+iQfrbSSpiC8tmUjm++mBkxbcfv6X1yNzaEiW
	RSUtvi2JYO92RO5NxIiIQywL84OC6gA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-T1KR_TPTPSmYg0ja9bmzgg-1; Wed, 29 Jan 2020 23:16:05 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D79851005513;
	Thu, 30 Jan 2020 04:15:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B466977924;
	Thu, 30 Jan 2020 04:15:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ECA2A87A74;
	Thu, 30 Jan 2020 04:15:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00U4FJfM024903 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 29 Jan 2020 23:15:19 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 33989F18D5; Thu, 30 Jan 2020 04:15:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F4E2ED14C
	for <dm-devel@redhat.com>; Thu, 30 Jan 2020 04:15:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1DC031011A7D
	for <dm-devel@redhat.com>; Thu, 30 Jan 2020 04:15:17 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-174-v59AZPYiNHihHSxcZ442Qg-1;
	Wed, 29 Jan 2020 23:15:13 -0500
From: pr-tracker-bot@kernel.org
In-Reply-To: <20200129171703.GA26110@redhat.com>
References: <20200129171703.GA26110@redhat.com>
X-PR-Tracked-List-Id: <linux-block.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200129171703.GA26110@redhat.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git
	tags/for-5.6/dm-changes
X-PR-Tracked-Commit-Id: 47ace7e012b9f7ad71d43ac9063d335ea3d6820b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e9f8ca0ae7b7bc9a032b429929431c626a69dd5e
Message-Id: <158035771095.9636.946294396868543275.pr-tracker-bot@kernel.org>
Date: Thu, 30 Jan 2020 04:15:10 +0000
To: Mike Snitzer <snitzer@redhat.com>
X-MC-Unique: v59AZPYiNHihHSxcZ442Qg-1
X-MC-Unique: T1KR_TPTPSmYg0ja9bmzgg-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00U4FJfM024903
X-loop: dm-devel@redhat.com
Cc: zhengbin <zhengbin13@huawei.com>, Dmitry Fomichev <dmitry.fomichev@wdc.com>,
	Heinz Mauelshagen <heinzm@redhat.com>,
	"xianrong.zhou" <xianrong.zhou@transsion.com>,
	Joe Thornber <ejt@redhat.com>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Anatol Pomazau <anatol@google.com>,
	Jeffle Xu <jefflexu@linux.alibaba.com>,
	Mikulas Patocka <mpatocka@redhat.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Milan Broz <gmazyland@gmail.com>, Alasdair G Kergon <agk@redhat.com>,
	Bryan Gurney <bgurney@redhat.com>
Subject: Re: [dm-devel] [git pull] device mapper changes for 5.6
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

The pull request you sent on Wed, 29 Jan 2020 12:17:03 -0500:

> git://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git tags/for-5.6/dm-changes

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e9f8ca0ae7b7bc9a032b429929431c626a69dd5e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

