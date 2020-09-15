Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id EDEB726AA1A
	for <lists+dm-devel@lfdr.de>; Tue, 15 Sep 2020 18:52:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600188777;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tuHLdXrkf/nssPeOKHpr2pjh6GCy5qom0a86TEy0Cio=;
	b=IO6UHRw5TLz/wJf+3VDIQL+MKHsW8cAgoCgZ0fHqwVRA7sW3oPQTsJn42/z1nCWh0DeEO2
	dlSnw1BLA1YQL8CNO3HoN0s4Q0KEGXXvjqQMpLA1QXmmT0LvHxMRnFqlgQR9/FUrSmihDx
	9Rz1v8vfZJnaGQjXxLhGj19V2MAmyEI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-wVeVRQLvN9-0aE_1Ey2eYg-1; Tue, 15 Sep 2020 12:52:54 -0400
X-MC-Unique: wVeVRQLvN9-0aE_1Ey2eYg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83CD21007466;
	Tue, 15 Sep 2020 16:52:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA6857BE49;
	Tue, 15 Sep 2020 16:52:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 17FC344A5D;
	Tue, 15 Sep 2020 16:52:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08FGqOBT000610 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 15 Sep 2020 12:52:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 158E210001B3; Tue, 15 Sep 2020 16:52:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C7C01000320;
	Tue, 15 Sep 2020 16:52:21 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 08FGqJQq004874; 
	Tue, 15 Sep 2020 11:52:19 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 08FGqIb1004873;
	Tue, 15 Sep 2020 11:52:18 -0500
Date: Tue, 15 Sep 2020 11:52:18 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20200915165218.GQ11108@octiron.msp.redhat.com>
References: <20200821224224.13536-1-mwilck@suse.com>
	<1fea6ca4ce7221461ddec39f37f2216e8cdd4c33.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <1fea6ca4ce7221461ddec39f37f2216e8cdd4c33.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 0/3]  Fixes for bitfield unit tests
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Sep 15, 2020 at 01:16:19PM +0200, Martin Wilck wrote:
> On Sat, 2020-08-22 at 00:42 +0200, mwilck@suse.com wrote:
> > From: Martin Wilck <mwilck@suse.com>
> > 
> > Hi Christophe, hi Ben,
> > 
> > embarassingly, it turns out that my unit test code for the bitfield
> > code was broken in various ways, which at the same time shows that
> > I didn't test this as broadly as I should have before submitting.
> > The good news is that only the test code was broken, not the
> > implementation itself.
> > 
> > With these fixes, I successfully compiled it on both little and
> > big endian architectures, with and without glibc 2.27.
> > (https://build.opensuse.org/package/show/Base:System/multipath-tools)
> > 
> > Regards,
> > Martin
> > 
> > Martin Wilck (3):
> >   multipath-tools tests: fix bitfield tests for small fields
> >   multipath-tools tests: fix bitfield tests for big endian
> >   multipath-tools tests: fix small bitfield tests for big endian
> > 
> >  tests/util.c | 146 ++++++++++++++++++++++++++++++++++++++++++-------
> > --
> >  1 file changed, 120 insertions(+), 26 deletions(-)
> 
> @Ben: Gentle review reminder ...

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> 
> Cheers,
> Martin
> 
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

