Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DD924F75
	for <lists+dm-devel@lfdr.de>; Tue, 21 May 2019 14:58:08 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DFE8DC0AD283;
	Tue, 21 May 2019 12:57:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B5C675E7C6;
	Tue, 21 May 2019 12:57:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 349BC1806B0E;
	Tue, 21 May 2019 12:57:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4LCv1mW023001 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 21 May 2019 08:57:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F1AB266833; Tue, 21 May 2019 12:57:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D96566834;
	Tue, 21 May 2019 12:56:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6F3BC3179162;
	Tue, 21 May 2019 12:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20170209;
	h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=FWJgqycH+Z2b7iPrfuL3t5rHQ361i1X/w+1sDUjJE10=;
	b=t27nPxWP4xWZ2ufZwL0Ccc7P4
	brykEqYBGst6SZmss0/JlPyWBLVvE1pDfd5/aK4w6zgSL3lniwLTMl8Q7FAgKGGnyZwRnJ/b2+qId
	+xc0rkaougndR9X+nn9NOJOvH/jILN88VuPVf8+N22LUFffuDC9RIWs15A56JS/UsL/rqyydyQbUC
	/g1tPKNG6GTm0SqM7KgrbJ8wHabC2kHA7+YAY6Za+tVQceP5fGNC4GgQehq9/ASpLP+S54Mmxwte1
	e3DXsVuUFEYFzEDA40ydRr4e6Q3t6W0ElcT21VSC3RIxw/XRn3zbtsMozZzWYE4atpIXzmTaRBeI7
	L9fPlxDhA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
	Hat Linux)) id 1hT4Jm-0002Pl-Fi; Tue, 21 May 2019 12:56:34 +0000
Date: Tue, 21 May 2019 05:56:34 -0700
From: Christoph Hellwig <hch@infradead.org>
To: "Guilherme G. Piccoli" <gpiccoli@canonical.com>
Message-ID: <20190521125634.GB16799@infradead.org>
References: <20190520220911.25192-1-gpiccoli@canonical.com>
	<20190520220911.25192-2-gpiccoli@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190520220911.25192-2-gpiccoli@canonical.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.41]); Tue, 21 May 2019 12:56:40 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]);
	Tue, 21 May 2019 12:56:40 +0000 (UTC) for IP:'198.137.202.133'
	DOMAIN:'bombadil.infradead.org' HELO:'bombadil.infradead.org'
	FROM:'BATV+dd3a5481af7880b59d64+5749+infradead.org+hch@bombadil.srs.infradead.org'
	RCPT:''
X-RedHat-Spam-Score: -2.398  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_NONE) 198.137.202.133 bombadil.infradead.org 198.137.202.133
	bombadil.infradead.org
	<BATV+dd3a5481af7880b59d64+5749+infradead.org+hch@bombadil.srs.infradead.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.41
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: axboe@kernel.dk, linux-raid@vger.kernel.org,
	Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
	kernel@gpiccoli.net, Song Liu <liu.song.a23@gmail.com>,
	stable@vger.kernel.org, Ming Lei <ming.lei@redhat.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	jay.vosburgh@canonical.com, gavin.guo@canonical.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Tue, 21 May 2019 12:58:07 +0000 (UTC)

On Mon, May 20, 2019 at 07:09:11PM -0300, Guilherme G. Piccoli wrote:
> No changes from V1, only rebased to v5.2-rc1.
> Also, notice that if [1] gets merged before this patch, the
> BIO_QUEUE_ENTERED flag will change to BIO_SPLITTED, so the (easy) conflict
> will need to be worked.
> 
> [1] https://lore.kernel.org/linux-block/20190515030310.20393-4-ming.lei@redhat.com/

Actually - that series should also fix you problem and avoid the need
for both patches in this series.  Can you please test it?

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
