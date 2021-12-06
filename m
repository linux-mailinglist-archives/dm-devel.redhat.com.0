Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 128DA469D31
	for <lists+dm-devel@lfdr.de>; Mon,  6 Dec 2021 16:27:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638804428;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SXkIUS8jy8a/6sUn1+CWZJDxifsnmczuVqhj4Byg1gU=;
	b=JMt/lYqdQ4nYhu9FZg97TB+DMe+iRPaWx7OS4Z99wCWmqscKI7uyNzPuN4Pd7B7ajCo1e0
	HixE0xNSHZD9d2drjt0/D7+Ry0svlzDpk3EwORElxaO3XLhcWNlRT90VA5rHRUOCMYnLnT
	MUGhAg+CfqHzOoBeFbqvTptqU5nWP4I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-487-F7mcL9i0NaqJrQMWcXCuWQ-1; Mon, 06 Dec 2021 10:27:04 -0500
X-MC-Unique: F7mcL9i0NaqJrQMWcXCuWQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C26B1853026;
	Mon,  6 Dec 2021 15:26:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A88919C59;
	Mon,  6 Dec 2021 15:26:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D98E14BB7C;
	Mon,  6 Dec 2021 15:26:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B6FNH12028275 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 6 Dec 2021 10:23:17 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 03C2245D63; Mon,  6 Dec 2021 15:23:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E33EB45D61;
	Mon,  6 Dec 2021 15:23:16 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 1B6FNFBA006301; 
	Mon, 6 Dec 2021 09:23:15 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 1B6FNEU9006300;
	Mon, 6 Dec 2021 09:23:14 -0600
Date: Mon, 6 Dec 2021 09:23:14 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Message-ID: <20211206152314.GX19591@octiron.msp.redhat.com>
References: <1638495252-15739-1-git-send-email-bmarzins@redhat.com>
	<1638495252-15739-2-git-send-email-bmarzins@redhat.com>
	<156c11a293ba2f59487dbeb7bdd959f49bf6de7d.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <156c11a293ba2f59487dbeb7bdd959f49bf6de7d.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 1/3] libmultipath: keep existing dm_info if
 you fail to get a new one
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Dec 03, 2021 at 08:01:11AM +0000, Martin Wilck wrote:
> On Thu, 2021-12-02 at 19:34 -0600, Benjamin Marzinski wrote:
> > There are reasons that dm_get_info() can fail other than the
> > multipath
> > device not existing. If there is an existing dm_info structure and
> > the
> > call fails, don't free it.
> > 
> > Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> 
> This is ok, but I think it'd be better to simply embed the dmi struct
> in struct multipath and thus avoid having allocate and free it
> separately. Either that, or just use a struct dm_info on stack  in
> dm_get_info() and just copy the properties we actually look at, i.e.
> read_only, major, minor, suspended, to respective fields in struct
> multipath. I'd prefer embedding the complete dmi, as it's not that
> large and contains other interesting fields, too (for example, we might
> be able to leverage the event_nr field to avoid duplicate work between
> uevent and dmevent handlers).
> 
> We would need to be able to figure out if the dmi is valid, but that's
> rather easy, we could simply set major = minor = 0.


Makes sense. I can change this.

-Ben

> 
> Regards
> Martin

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

