Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E787B256A3
	for <lists+dm-devel@lfdr.de>; Tue, 21 May 2019 19:26:27 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3D2FE3082B4D;
	Tue, 21 May 2019 17:25:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D2C26085B;
	Tue, 21 May 2019 17:25:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E91A85B424;
	Tue, 21 May 2019 17:24:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4LHNPu4014375 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 21 May 2019 13:23:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D1CB66085B; Tue, 21 May 2019 17:23:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AF6BF608C2;
	Tue, 21 May 2019 17:23:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8F176307CDEA;
	Tue, 21 May 2019 17:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=F6hzvh3Jla0WhoTxfizl6fXxrFIMr5UOMU03ImxH5Ac=;
	b=b+/W6d2WiUF/OIvuwtkfb/SkH
	/3+H3kA7ADfToOu3edm4BJ3fw83zXGvUfTGn1nWi+7xh+UsRyQzwtjc5D7TE5KH0Yxdt2+Ntb1JuT
	k+UkYrfqVygj7Ya7vRRjZeMSv7/0B8vELoNfEcC5S6znYc0nJZ45UQ6g/RrdMF3atTmuXQGLIkUeL
	FSIJnnHuCkxK5wpUfYxJ4YtgoLzHO7WvKGn80nF/J8dK81cS52b2JeWuhIINVflNpYjn/gopPVt7r
	8wdidUGKN9XC0VtidvYMf7NIFF+tcNRHEnIFVJhWN8Eu0WFbjrUqmsi1Oyaz1Ie9gtNMgjKTgf+JY
	xAmvcaRsw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
	Hat Linux)) id 1hT8Ta-0002Ug-G4; Tue, 21 May 2019 17:22:58 +0000
Date: Tue, 21 May 2019 10:22:58 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Guilherme Piccoli <gpiccoli@canonical.com>
Message-ID: <20190521172258.GA32702@infradead.org>
References: <20190520220911.25192-1-gpiccoli@canonical.com>
	<20190520220911.25192-2-gpiccoli@canonical.com>
	<20190521125634.GB16799@infradead.org>
	<CAHD1Q_z23AO+NRid1xYTeke_5GAe6hPianEZKBf5P30FrfZGFg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHD1Q_z23AO+NRid1xYTeke_5GAe6hPianEZKBf5P30FrfZGFg@mail.gmail.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.49]); Tue, 21 May 2019 17:23:09 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Tue, 21 May 2019 17:23:09 +0000 (UTC) for IP:'198.137.202.133'
	DOMAIN:'bombadil.infradead.org' HELO:'bombadil.infradead.org'
	FROM:'BATV+dd3a5481af7880b59d64+5749+infradead.org+hch@bombadil.srs.infradead.org'
	RCPT:''
X-RedHat-Spam-Score: -2.398  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_NONE) 198.137.202.133 bombadil.infradead.org 198.137.202.133
	bombadil.infradead.org
	<BATV+dd3a5481af7880b59d64+5749+infradead.org+hch@bombadil.srs.infradead.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: axboe@kernel.dk, linux-block@vger.kernel.org,
	linux-raid <linux-raid@vger.kernel.org>,
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	"Guilherme G. Piccoli" <kernel@gpiccoli.net>,
	Song Liu <liu.song.a23@gmail.com>, stable@vger.kernel.org,
	Ming Lei <ming.lei@redhat.com>,
	Christoph Hellwig <hch@infradead.org>, dm-devel@redhat.com,
	Jay Vosburgh <jay.vosburgh@canonical.com>,
	Gavin Guo <gavin.guo@canonical.com>
Subject: Re: [dm-devel] [PATCH V2 2/2] md/raid0: Do not bypass blocking
 queue entered for raid0 bios
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Tue, 21 May 2019 17:26:26 +0000 (UTC)

On Tue, May 21, 2019 at 11:10:05AM -0300, Guilherme Piccoli wrote:
> Hi Christoph, thanks for looking into this.
> You're right, this series fixes both issues. The problem I see though
> is that it relies
> on legacy IO path removal - for v5.0 and beyond, all fine. But
> backporting that to
> v4.17-v4.20 stable series will be quite painful.
> 
> My fixes are mostly "oneliners". If we could get both approaches upstream,
> that'd be perfect!

But they basically just fix code that otherwise gets removed.  And the way
this patches uses the ENTERED flag from the md code looks slightly
sketchy to me.  Maybe we want them as stable only patches.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
