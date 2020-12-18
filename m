Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id CDB9E2DE77F
	for <lists+dm-devel@lfdr.de>; Fri, 18 Dec 2020 17:34:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608309260;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/wlOZXTZWNQ7WDn2SwPAUovMiirgP1BknQ/BIOEu+Tw=;
	b=eeaubzPU3tSOYK8mvrXQhz1Qmt6CyLzXXsBndcNncZaB/HVLy3ph9Z2JYzgyKQNdDONpw2
	JfDPPJ7yZbS4qtjz5FQ42OqIRW8fXPFYv6P5wUU6PQlVemz9dJvTiKTjSVItB39hE6vTCx
	MnbgejVNK0L8yg5nKnzl28fLggilHAg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-K0syAZO5Ns2s3MzB_VmKVA-1; Fri, 18 Dec 2020 11:34:18 -0500
X-MC-Unique: K0syAZO5Ns2s3MzB_VmKVA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E55FDCE646;
	Fri, 18 Dec 2020 16:34:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 236A760C47;
	Fri, 18 Dec 2020 16:34:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7B6194BB7B;
	Fri, 18 Dec 2020 16:34:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BIGWd1e022570 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 18 Dec 2020 11:32:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1695019EF2; Fri, 18 Dec 2020 16:32:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F243A2C01E;
	Fri, 18 Dec 2020 16:32:38 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 0BIGWbVu007792; 
	Fri, 18 Dec 2020 10:32:37 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 0BIGWbMZ007791;
	Fri, 18 Dec 2020 10:32:37 -0600
Date: Fri, 18 Dec 2020 10:32:36 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20201218163236.GI3103@octiron.msp.redhat.com>
References: <20201217110018.3347-1-mwilck@suse.com>
	<20201217110018.3347-3-mwilck@suse.com>
	<20201218000311.GD3103@octiron.msp.redhat.com>
	<4e17c5f7ae1c911dc280458cda3ccb5578c0de9e.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <4e17c5f7ae1c911dc280458cda3ccb5578c0de9e.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 2/7] libmultipath: protect logarea with
	logq_lock
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Dec 18, 2020 at 05:24:25PM +0100, Martin Wilck wrote:
> On Thu, 2020-12-17 at 18:03 -0600, Benjamin Marzinski wrote:
> > On Thu, Dec 17, 2020 at 12:00:13PM +0100, mwilck@suse.com wrote:
> > >  
> > > -void free_logarea (void)
> > > +static void free_logarea (void)
> > >  {
> > >  	FREE(la->start);
> > >  	FREE(la->buff);
> > 
> > I realize that the log area can only be freed by log_close(), which
> > is
> > called when mulitpathd exits, but it would be nice to have la set to
> > NULL it's freed, just to make it obvious that that there can't be
> > double-frees there. 
> 
> There's FREE(la) right after this, and FREE(x) sets the pointer to
> NULL. So it should be fine, or am I confused?
> 

Yep it's fine. It was me missing that.

-Ben

> > However, the code is clearly correct, so
> > 
> > Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> 
> Thanks,
> Martin
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

