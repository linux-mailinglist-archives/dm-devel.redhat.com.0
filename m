Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id E5CF61C9D06
	for <lists+dm-devel@lfdr.de>; Thu,  7 May 2020 23:14:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588886054;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=aTL9TmdBM6D1igmRXpkDKPhEoPlBqD+Y9eLSPr9mzbQ=;
	b=H4jQgA2z1N3tHdH2MTR5RrxQp0Ey07yxF9pFLANx4p+mf9Pcpae2MKnP1wRuJlUEGfDJgR
	nfUnSlOIkJIBERGcdgobEE0ftZINVM+8LzwudgLrOkfGeV/AisP/KELc65fvKHYuP890ko
	ZV2LgoyDom52OCQnwAfppWtzHmv+CNA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-aU-qAC9UNn-OqmFFQfi8XQ-1; Thu, 07 May 2020 17:14:12 -0400
X-MC-Unique: aU-qAC9UNn-OqmFFQfi8XQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0619280183C;
	Thu,  7 May 2020 21:14:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A05460BF1;
	Thu,  7 May 2020 21:14:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9DFFF4CAA0;
	Thu,  7 May 2020 21:13:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 047LDLKG025950 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 7 May 2020 17:13:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1F3B910487EE; Thu,  7 May 2020 21:13:21 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B7FC1043DFB
	for <dm-devel@redhat.com>; Thu,  7 May 2020 21:13:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 525E480CDAE
	for <dm-devel@redhat.com>; Thu,  7 May 2020 21:13:18 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-43-rzcn2vwoNqOjCdocpBFWLA-1;
	Thu, 07 May 2020 17:13:15 -0400
X-MC-Unique: rzcn2vwoNqOjCdocpBFWLA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 06D34AC46;
	Thu,  7 May 2020 21:13:16 +0000 (UTC)
Message-ID: <858eb4ffcd9405ba7c10ed11f1d4c720a8ed496f.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Christian Hesse <list@eworm.de>, dm-devel@redhat.com
Date: Thu, 07 May 2020 23:13:12 +0200
In-Reply-To: <20200506094828.727f1d3a@leda>
References: <20200506073548.41756-1-list@eworm.de>
	<20200506073548.41756-2-list@eworm.de> <20200506094828.727f1d3a@leda>
User-Agent: Evolution 3.36.2
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 047LDLKG025950
X-loop: dm-devel@redhat.com
Cc: Christian Hesse <mail@eworm.de>
Subject: Re: [dm-devel] [PATCH 2/2] libmultipath: create libdir on install
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2020-05-06 at 09:48 +0200, Christian Hesse wrote:
> Christian Hesse <list@eworm.de> on Wed, 2020/05/06 09:35:
> > From: Christian Hesse <mail@eworm.de>
> > 
> > Without this installation fails with:
> > 
> > install: target '$DESTDIR/usr/lib/multipath' is not a directory
> > Signed-off-by: Christian Hesse <mail@eworm.de>
> > ---
> >  libmultipath/prioritizers/Makefile | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/libmultipath/prioritizers/Makefile
> > b/libmultipath/prioritizers/Makefile index 9d0fe03c..11da5be2
> > 100644
> > --- a/libmultipath/prioritizers/Makefile
> > +++ b/libmultipath/prioritizers/Makefile
> > @@ -35,6 +35,7 @@ libprio%.so: %.o
> >  	$(CC) $(LDFLAGS) $(SHARED_FLAGS) -o $@ $^
> >  
> >  install: $(LIBS)
> > +	$(INSTALL_PROGRAM) -d $(DESTDIR)$(libdir)
> >  	$(INSTALL_PROGRAM) -m 755 libprio*.so $(DESTDIR)$(libdir)
> >  
> >  uninstall:
> 
> Ignore this one... It does not fix the issue. The build system has to
> be
> fixed for simultaneous jobs when installing.
> 
> For now installing with just one job (`make -j1`).

Right. Feel free to send patches for this. I've never felt the urge to
run "make install" parallelized; it takes less then 1s on my laptop.

Martin



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

