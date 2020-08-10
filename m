Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 3E061240D6F
	for <lists+dm-devel@lfdr.de>; Mon, 10 Aug 2020 21:08:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597086485;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CekxN7C0TriLBuB6TLOe64aLeSRhqKO5bU2jo4nIqU8=;
	b=O001q/bSq5md/QYm/xuDotgXw2U49Kq4IhiwT+Yyq8dYrRPNTII6/lVm7Z8bRpN8EPY7Lg
	HpdbIFKgVDRl27Z3uxouBWtGTKk2uVO0/mk+V62opEWkUzIl8xllrycZb4GZUCH6XcF0EV
	JO5o2k4crnK7Yg6NQYPz6tmo6ainnA0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-ob8aRisJN5eVxAG9uYbqVA-1; Mon, 10 Aug 2020 15:08:03 -0400
X-MC-Unique: ob8aRisJN5eVxAG9uYbqVA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2087F10059A2;
	Mon, 10 Aug 2020 19:07:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 143EF87D6E;
	Mon, 10 Aug 2020 19:07:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3AB6195A75;
	Mon, 10 Aug 2020 19:07:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07AJ7iDf006667 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 10 Aug 2020 15:07:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7F4085F1E4; Mon, 10 Aug 2020 19:07:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 93E9C87D6F;
	Mon, 10 Aug 2020 19:07:40 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 07AJ7dCW002765; 
	Mon, 10 Aug 2020 14:07:39 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 07AJ7cPb002763;
	Mon, 10 Aug 2020 14:07:38 -0500
Date: Mon, 10 Aug 2020 14:07:38 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20200810190738.GN19233@octiron.msp.redhat.com>
References: <40a7ea22-8897-363a-5821-99add9de6dc5@huawei.com>
	<7d0e4a58ddec95d141433c5f472865cba6961459.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <7d0e4a58ddec95d141433c5f472865cba6961459.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: yanxiaodan@huawei.com, linfeilong@huawei.com, dm-devel@redhat.com,
	Zdenek Kabelac <zkabelac@redhat.com>,
	Zhiqiang Liu <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH V2] libmultipath: free pp if store_path fails
 in disassemble_map
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Aug 10, 2020 at 02:20:27PM +0200, Martin Wilck wrote:
> Hello Liu,
> 
> On Fri, 2020-07-24 at 09:40 +0800, Zhiqiang Liu wrote:
> > In disassemble_map func, one pp will be allocated and stored in
> > pgp->paths. However, if store_path fails, pp will not be freed,
> > then memory leak problem occurs.
> > 
> > Here, we will call free_path to free pp when store_path fails.
> > 
> > Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> > Signed-off-by: lixiaokeng <lixiaokeng@huawei.com>
> > ---
> > V1->V2: update based on ups/submit-2007 branch.
> > 
> >  libmultipath/dmparser.c | 9 +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> > 
> 
> thanks for the patch. I'd suggest to do this without the pp_alloc_flag
> variable, by pulling the store_path() call into the if (!pp)
> conditional and treating failure differently in both branches of the
> conditional. (Side note: if we introduce a boolean like this, we should
> use "bool" as the variable type).
> 
> Unless you object, I'll add that change on top of my submit-2007
> series, giving you appropriate credits.
> 
> @Ben, @Christophe: I've been considering for some time to start
> handling cases like this with __attribute__((cleanup(f)))) (
> https://gcc.gnu.org/onlinedocs/gcc/Common-Variable-Attributes.html).
> That could reduce the amount of goto clauses for error handling
> significantly. It would be a major change in coding style though. What
> do you think?

So, I haven't really looked into the cleanup attribute. How would it
work here? We only want to free the path if we didn't store it. We can't
free it if it got stored.  Can you disable the cleanup? If we have to
make the cleanup function check if the path got stored, that seems like
more work than simply using the multiple goto labels like we do now.

-Ben

> 
> Regards,
> Martin
> 
> 
> > diff --git a/libmultipath/dmparser.c b/libmultipath/dmparser.c
> > index b9858fa5..8a0501ba 100644
> > --- a/libmultipath/dmparser.c
> > +++ b/libmultipath/dmparser.c
> > @@ -143,6 +143,7 @@ int disassemble_map(const struct _vector
> > *pathvec,
> >  	int def_minio = 0;
> >  	struct path * pp;
> >  	struct pathgroup * pgp;
> > +	int pp_alloc_flag = 0;
> > 
> >  	assert(pathvec != NULL);
> >  	p = params;
> > @@ -292,6 +293,7 @@ int disassemble_map(const struct _vector
> > *pathvec,
> > 
> >  		for (j = 0; j < num_paths; j++) {
> >  			pp = NULL;
> > +			pp_alloc_flag = 0;
> >  			p += get_word(p, &word);
> > 
> >  			if (!word)
> > @@ -304,13 +306,16 @@ int disassemble_map(const struct _vector
> > *pathvec,
> > 
> >  				if (!pp)
> >  					goto out1;
> > -
> > +				pp_alloc_flag = 1;
> >  				strlcpy(pp->dev_t, word, BLK_DEV_SIZE);
> >  			}
> >  			FREE(word);
> > 
> > -			if (store_path(pgp->paths, pp))
> > +			if (store_path(pgp->paths, pp)) {
> > +				if (pp_alloc_flag)
> > +					free_path(pp);
> >  				goto out;
> > +			}
> > 
> >  			pgp->id ^= (long)pp;
> >  			pp->pgindex = i + 1;
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

