Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9552E96638
	for <lists+dm-devel@lfdr.de>; Tue, 20 Aug 2019 18:24:00 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BB8CE102BB36;
	Tue, 20 Aug 2019 16:23:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 64AA887D8;
	Tue, 20 Aug 2019 16:23:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 64E142551C;
	Tue, 20 Aug 2019 16:23:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7KGNWPC000543 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 20 Aug 2019 12:23:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3C7BE423D; Tue, 20 Aug 2019 16:23:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A10F41DD;
	Tue, 20 Aug 2019 16:23:27 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 78A0CC05975D;
	Tue, 20 Aug 2019 16:23:26 +0000 (UTC)
Received: from localhost (wsip-184-188-36-2.sd.sd.cox.net [184.188.36.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id E092322CE3;
	Tue, 20 Aug 2019 16:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1566318206;
	bh=RH7qOcHp/IW4wG14fcdhpt2BAemQ/ZyxsJxyL8qNrdY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ets7EHTexT3m9SrSn6Up38mCsD1NwHrz6LAzq2oKCJiCNAiCYPeHPV+uyWBGgU6BP
	SF77wrm99ICpTnZHVsx+KqFHzOam8rWzclDv85lAa3yZzQcR0NUNbWu7lislgqcEWu
	KK2YyxWcNvoVLUlN9nKpP7rxFyehZjGEdQ1sTFMk=
Date: Tue, 20 Aug 2019 09:23:25 -0700
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Salvatore Bonaccorso <carnil@debian.org>
Message-ID: <20190820162325.GB8214@kroah.com>
References: <20190818155941.GA26766@eldamar.local>
	<20190818183305.GA1181@kroah.com>
	<20190818204436.GA27437@eldamar.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190818204436.GA27437@eldamar.local>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 20 Aug 2019 16:23:26 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]);
	Tue, 20 Aug 2019 16:23:26 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'gregkh@linuxfoundation.org' RCPT:''
X-RedHat-Spam-Score: -5.001  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_PASS) 198.145.29.99 mail.kernel.org 198.145.29.99 mail.kernel.org
	<gregkh@linuxfoundation.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.32
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: Sasha Levin <sashal@kernel.org>, David Jeffery <djeffery@redhat.com>,
	Mike Snitzer <snitzer@redhat.com>,
	Chris Hofstaedtler <zeha@debian.org>, dm-devel@redhat.com,
	stable@vger.kernel.org, Ben Hutchings <ben@decadent.org.uk>,
	Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] Backport request for bcb44433bba5 ("dm: disable
 DISCARD if the underlying storage no longer supports it")
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.64]); Tue, 20 Aug 2019 16:23:59 +0000 (UTC)

On Sun, Aug 18, 2019 at 10:44:36PM +0200, Salvatore Bonaccorso wrote:
> hi Greg,
> 
> On Sun, Aug 18, 2019 at 08:33:05PM +0200, Greg Kroah-Hartman wrote:
> > On Sun, Aug 18, 2019 at 05:59:41PM +0200, Salvatore Bonaccorso wrote:
> > > Hi
> > > 
> > > In Debian bug https://bugs.debian.org/934331 ran into issues which
> > > match the upstream commit bcb44433bba5 ("dm: disable DISCARD if the
> > > underlying storage no longer supports it").
> > > 
> > > This commit was CC'ed to stable, but only got applied in v5.0.8 (and
> > > later on backported by Ben Hutchings to v3.16.72).
> > > 
> > > Mike, I have not checked how easily that would be for older stable
> > > versions, but can the backport be considered for versions down to 4.9?
> > > Apparently Ben did succeed with some changes needed. To 4.19 it should
> > > apply with a small conflict in drivers/md/dm-core.h AFAICS.
> > 
> > If someone sends the backports to the list, I will be glad to queue them
> > up.
> 
> Here is the one for 4.19 on top of 4.19.67. It's my first contribution
> on this regard. Given the change to be applied was only about the
> context change in drivers/md/dm-core.h I'm unsure if the Signed-off-by
> is the right addition to do as well.

Yes it is!

Now queued up, thanks.

greg k-h

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
