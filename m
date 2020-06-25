Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id ECD8B2099A8
	for <lists+dm-devel@lfdr.de>; Thu, 25 Jun 2020 07:58:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593064680;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lBkHmVLvjtHDGw7Ksdei07Ehw56QQJyZ91DUZgQ51EQ=;
	b=DQj0AZCHhLkkTpUgBTs6q6yIDb7qEQ5NHoic5EYwXakn9scRph24e2ph4HwUf2vMNro9av
	BiJDLxSwVkrqhJDtwTOHkV2Xevz+QIyCIURGtvCou1XwS5ZgJdI82maHGP8KAiA1Dbkcj2
	xX+9Mp8NuXUxJOA4UnHag4it6sTmefo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380--lx9WT9nOHyTs4lfFCJgHg-1; Thu, 25 Jun 2020 01:57:58 -0400
X-MC-Unique: -lx9WT9nOHyTs4lfFCJgHg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C162107ACCA;
	Thu, 25 Jun 2020 05:57:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CDAEB2B4B7;
	Thu, 25 Jun 2020 05:57:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 66FE4833A2;
	Thu, 25 Jun 2020 05:57:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05P5usF1020602 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 25 Jun 2020 01:56:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0605F2144B35; Thu, 25 Jun 2020 05:56:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 00FAA217B43C
	for <dm-devel@redhat.com>; Thu, 25 Jun 2020 05:56:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 88208800394
	for <dm-devel@redhat.com>; Thu, 25 Jun 2020 05:56:51 +0000 (UTC)
Received: from smtprelay.hostedemail.com (smtprelay0118.hostedemail.com
	[216.40.44.118]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-237-jsOrmrlyOSqfvFAa730lGg-1; Thu, 25 Jun 2020 01:56:47 -0400
X-MC-Unique: jsOrmrlyOSqfvFAa730lGg-1
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
	[10.5.19.251])
	by smtpgrave01.hostedemail.com (Postfix) with ESMTP id A8CB41802187C;
	Thu, 25 Jun 2020 05:51:00 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
	[216.40.38.60])
	by smtprelay05.hostedemail.com (Postfix) with ESMTP id 2E12618029120;
	Thu, 25 Jun 2020 05:50:59 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
	RULES_HIT:41:355:379:560:599:960:973:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1730:1747:1777:1792:2393:2553:2559:2562:2828:2895:3138:3139:3140:3141:3142:3353:3622:3867:3868:3871:3872:4321:5007:6742:7875:10004:10400:10848:11026:11232:11658:11914:12296:12297:12740:12760:12895:13069:13311:13357:13439:14659:14721:21080:21627:21740:21990:30012:30034:30054:30070:30090:30091,
	0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
	DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none,
	Custom_rules:0:0:0, LFtime:1, LUA_SUMMARY:none
X-HE-Tag: head29_411519126e4a
X-Filterd-Recvd-Size: 2280
Received: from XPS-9350.home (unknown [47.151.133.149])
	(Authenticated sender: joe@perches.com)
	by omf06.hostedemail.com (Postfix) with ESMTPA;
	Thu, 25 Jun 2020 05:50:57 +0000 (UTC)
Message-ID: <51ca818443648cb25a604448dea022d6ac2ea09f.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Kees Cook <keescook@chromium.org>, Aiden Leong <aiden.leong@aibsd.com>
Date: Wed, 24 Jun 2020 22:50:56 -0700
In-Reply-To: <202006242231.E17DAB2@keescook>
References: <20200625041141.8053-1-aiden.leong@aibsd.com>
	<202006242231.E17DAB2@keescook>
User-Agent: Evolution 3.36.2-0ubuntu1
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Mike, Tony Luck <tony.luck@intel.com>, Snitzer <snitzer@redhat.com>,
	Ferdinand Blomqvist <ferdinand.blomqvist@gmail.com>,
	"Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	Anton Vorontsov <anton@enomsg.org>,
	YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
	dm-devel@redhat.com, Cross <ccross@android.com>, Colin,
	Thomas Gleixner <tglx@linutronix.de>, Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [RFC] Reed-Solomon Code: Update no_eras to the
 actual number of errors
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2020-06-24 at 22:35 -0700, Kees Cook wrote:
> On Wed, Jun 24, 2020 at 09:10:53PM -0700, Aiden Leong wrote:
> > Corr and eras_pos are updated to actual correction pattern and erasure
> > positions, but no_eras is not.
[]
> > @@ -312,14 +313,21 @@
> >  				eras_pos[j++] = loc[i] - pad;
> >  			}
> >  		}
> > +		if (no_eras > 0)
> > +			*no_eras = j;
> 
> Is this meant to be "if (j > 0)" or "if (no_eras != NULL)" ? It's
> uncommon to use > 0 for a pointer value.
> 
> >  	} else if (data && par) {
> >  		/* Apply error to data and parity */
> > +		j = 0;
> >  		for (i = 0; i < count; i++) {
> >  			if (loc[i] < (nn - nroots))
> >  				data[loc[i] - pad] ^= b[i];
> >  			else
> >  				par[loc[i] - pad - len] ^= b[i];
> > +			if (b[i])
> > +				j++;
> >  		}
> > +		if (no_eras > 0)
> > +			*no_eras = j;
> 
> I assume it's a pointer test, so both would be:
> 
> 		if (no_eras_ptr != NULL)
> 			*no_eras_ptr = j;

More common still would be

		if (no_eras_ptr)
			*no_eras_ptr = j;

though I think using _ptr is too Hungarian.


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

