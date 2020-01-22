Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 86DB6145453
	for <lists+dm-devel@lfdr.de>; Wed, 22 Jan 2020 13:21:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579695698;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KEK/r/OCqxStz3QWKqLBlHjy7OW6G/54ranByH398tY=;
	b=Ov9XBKeKvpjWOYZ4holkOApNad5Cj+2YMCWghw+bi3HyzFtsOhquFlTRiNP3MEyL8mONVK
	x8EkBwNw2S4QZsC6UbFULJEpy5Wv30GarYzLdLwuqpBx8pwhFJnpTrC7y+KcT0b2n+FznT
	iLvYTSlHY+SYyGcfIoFziqUiVxIODi0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-kGigQPUUOqSDtwdRE9yzjg-1; Wed, 22 Jan 2020 07:21:36 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5024D8010C9;
	Wed, 22 Jan 2020 12:21:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8AA0E5DA60;
	Wed, 22 Jan 2020 12:21:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7A93F8709A;
	Wed, 22 Jan 2020 12:21:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00MCKuIH007211 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 22 Jan 2020 07:20:56 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9C2FF85726; Wed, 22 Jan 2020 12:20:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 295D51CB;
	Wed, 22 Jan 2020 12:20:54 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 00MCKrgn025048; 
	Wed, 22 Jan 2020 06:20:53 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 00MCKq5L025047;
	Wed, 22 Jan 2020 06:20:52 -0600
Date: Wed, 22 Jan 2020 06:20:52 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20200122122052.GZ30153@octiron.msp.redhat.com>
References: <1579227500-17196-1-git-send-email-bmarzins@redhat.com>
	<1579227500-17196-10-git-send-email-bmarzins@redhat.com>
	<6d1c7f92c9d68c8a1e602ecb36cc1390e0f936de.camel@suse.de>
	<20200122085143.GW30153@octiron.msp.redhat.com>
	<82dacc11f74946eec79eed0f35a075ba592cad49.camel@suse.de>
MIME-Version: 1.0
In-Reply-To: <82dacc11f74946eec79eed0f35a075ba592cad49.camel@suse.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 09/15] libmultipath: add code to get vendor
 specific vpd data
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: kGigQPUUOqSDtwdRE9yzjg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Jan 22, 2020 at 12:52:10PM +0100, Martin Wilck wrote:
> On Wed, 2020-01-22 at 02:51 -0600, Benjamin Marzinski wrote:
> > On Fri, Jan 17, 2020 at 05:56:40PM +0100, Martin Wilck wrote:
> > > On Thu, 2020-01-16 at 20:18 -0600, Benjamin Marzinski wrote:
> > > BUT ok, that's overengineered with just one supported combination
> > > of
> > > page and vendor. I can understand that. But then, it seems also
> > > overengineered to carry around vpd_vendor_pg and vpd_vendor_id in
> > > the
> > > hwe. 
> > > 
> > > I'd suggest creating a hard-coded table with "vendor vpd schemes",
> > > 
> > > struct {
> > > 	int pg;
> > > 	int vendor_id;
> > > 	const char *name;
> > > } vendor_vpd_schemes[]  = { 
> > >     { 0xc0, VPD_VP_HP3PAR, "hp3par", }, 
> > >     { 0, }, 
> > > };
> > > 
> > > and in the hwentry, only carry around the index into this table,
> > > and look up the page and vendor ID there. Actually, with just that
> > > single user, we might as well not introduce a new device property
> > > at
> > > all, but simply use a separate hardcoded table with lookup values
> > > for
> > > vendor and product ID. I'm unsure if it's wise to make this
> > > configurable via multipath.conf.
> > 
> > Sure. I can make the hwe change. The reason why I added this to
> > multipath.conf is that I'm not sure what devices actually support
> > these
> > vpd information pages.  So, if we miss one, or a new device comes out
> > that isn't in the built-in config, the user can still get this info.
> > 
> 
> My main issue was that you have 2 fields in struct hwentry, and only
> one field in the hwtable. I think I made the point that I'd prefer to
> have only one everywhere, and use some sort of lookup table for the
> page and vendor ID parameters.

I meant I agreed with this approach.

> Another issue that I realized just now, the "vendor_id" is not
> standardized - it's just an internal identifier used by sg3_utils and
> has no specific meaning outside the sg3_utils code base. Even it's
> numeric value has changed between sg3_utils versions. I think we should
> cast it away, and simply stick with the symbolic identifier. Keeping
> that symbolic name in line with sg3_utils makes a lot of sense, of
> course.

Yeah, another reason I didn't go with vpd_vendor_pg and vpd_vendor_id
was that on earlier versions of sg_vpd, the vpd_vendor_id for
hp3par was different. We can easily remove it altogether.

-Ben

> Regards,
> Martin
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

