Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 891C3145417
	for <lists+dm-devel@lfdr.de>; Wed, 22 Jan 2020 12:51:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579693896;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hZ7UuAk1ena2oiTrlO34elgUoQhSIS2n2ZCbLRuWu5E=;
	b=XQyOd1A0B9vS9rYqgGVtfcjMdLxDE5VGOWxQvI5PqjKNwX6RfH2pt61TnHtGf+c3HoWtkO
	K83K8J6Bb9k1SrV3DjkFoS8MSjlIQIj7JdJC+MBWLZxUdhyuNciAa5E+s8G1RClZj34IpU
	s/C5YXOf7a2edxv+nyN5DFI30Uxa0lg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-xPGe-bIxMhSsC6zmMA07eA-1; Wed, 22 Jan 2020 06:51:34 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CCE0A107ACC4;
	Wed, 22 Jan 2020 11:51:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5571F5D9C9;
	Wed, 22 Jan 2020 11:51:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 70F6718089CD;
	Wed, 22 Jan 2020 11:51:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00MBoxQ8005246 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 22 Jan 2020 06:50:59 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 072E92026D67; Wed, 22 Jan 2020 11:50:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 014262017E93
	for <dm-devel@redhat.com>; Wed, 22 Jan 2020 11:50:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 15B3F101D230
	for <dm-devel@redhat.com>; Wed, 22 Jan 2020 11:50:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-402-GFnxgR-DMqmuURtDVeDvxg-1;
	Wed, 22 Jan 2020 06:50:53 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 99827B303;
	Wed, 22 Jan 2020 11:50:51 +0000 (UTC)
Message-ID: <82dacc11f74946eec79eed0f35a075ba592cad49.camel@suse.de>
From: Martin Wilck <mwilck@suse.com>
To: dm-devel@redhat.com, Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 22 Jan 2020 12:52:10 +0100
In-Reply-To: <20200122085143.GW30153@octiron.msp.redhat.com>
References: <1579227500-17196-1-git-send-email-bmarzins@redhat.com>
	<1579227500-17196-10-git-send-email-bmarzins@redhat.com>
	<6d1c7f92c9d68c8a1e602ecb36cc1390e0f936de.camel@suse.de>
	<20200122085143.GW30153@octiron.msp.redhat.com>
User-Agent: Evolution 3.34.3
MIME-Version: 1.0
X-MC-Unique: GFnxgR-DMqmuURtDVeDvxg-1
X-MC-Unique: xPGe-bIxMhSsC6zmMA07eA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00MBoxQ8005246
X-loop: dm-devel@redhat.com
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2020-01-22 at 02:51 -0600, Benjamin Marzinski wrote:
> On Fri, Jan 17, 2020 at 05:56:40PM +0100, Martin Wilck wrote:
> > On Thu, 2020-01-16 at 20:18 -0600, Benjamin Marzinski wrote:
> > > This adds the wildcard 'g' for multipath and path formatted
> > > printing,
> > > which returns extra data from a device's vendor specific vpd
> > > page.  The
> > > specific vendor vpd page to use, and the vendor/product id to
> > > decode
> > > it
> > > can be set in the hwentry with vpd_vendor_pg and vpd_vendor_id.
> > > It
> > > can
> > > be configured in the devices section of multipath.conf with the
> > > vpd_vendor parameter. Currently, the only devices that use this
> > > are
> > > HPE
> > > 3PAR arrays, to return the Volume Name.
> > > 
> > > Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
> > > ---
> > >  libmultipath/config.c      |  4 ++++
> > >  libmultipath/config.h      |  2 ++
> > >  libmultipath/dict.c        | 34
> > > ++++++++++++++++++++++++++++++++++
> > >  libmultipath/discovery.c   | 34
> > > +++++++++++++++++++++++++++++++++-
> > >  libmultipath/hwtable.c     |  2 ++
> > >  libmultipath/print.c       | 27 +++++++++++++++++++++++++++
> > >  libmultipath/propsel.c     | 24 ++++++++++++++++++++++++
> > >  libmultipath/propsel.h     |  2 ++
> > >  libmultipath/structs.h     |  9 +++++++++
> > >  multipath/multipath.conf.5 |  8 ++++++++
> > >  10 files changed, 145 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/libmultipath/config.c b/libmultipath/config.c
> > > index 85626e96..72b8d37c 100644
> > > --- a/libmultipath/config.c
> > > +++ b/libmultipath/config.c
> > > @@ -369,6 +369,8 @@ merge_hwe (struct hwentry * dst, struct
> > > hwentry *
> > > src)
> > >  	merge_num(max_sectors_kb);
> > >  	merge_num(ghost_delay);
> > >  	merge_num(all_tg_pt);
> > > +	merge_num(vpd_vendor_pg);
> > > +	merge_num(vpd_vendor_id);
> > >  	merge_num(san_path_err_threshold);
> > >  	merge_num(san_path_err_forget_rate);
> > >  	merge_num(san_path_err_recovery_time);
> > > @@ -517,6 +519,8 @@ store_hwe (vector hwtable, struct hwentry *
> > > dhwe)
> > >  	hwe->detect_prio = dhwe->detect_prio;
> > >  	hwe->detect_checker = dhwe->detect_checker;
> > >  	hwe->ghost_delay = dhwe->ghost_delay;
> > > +	hwe->vpd_vendor_pg = dhwe->vpd_vendor_pg;
> > > +	hwe->vpd_vendor_id = dhwe->vpd_vendor_id;
> > >  
> > >  	if (dhwe->bl_product && !(hwe->bl_product = set_param_str(dhwe-
> > > > bl_product)))
> > >  		goto out;
> > > diff --git a/libmultipath/config.h b/libmultipath/config.h
> > > index e69aa07c..589146de 100644
> > > --- a/libmultipath/config.h
> > > +++ b/libmultipath/config.h
> > > @@ -87,6 +87,8 @@ struct hwentry {
> > >  	int max_sectors_kb;
> > >  	int ghost_delay;
> > >  	int all_tg_pt;
> > > +	int vpd_vendor_pg;
> > > +	int vpd_vendor_id;
> > >  	char * bl_product;
> > >  };
> > >  
> > > diff --git a/libmultipath/dict.c b/libmultipath/dict.c
> > > index 2b046e1d..d6d8b79b 100644
> > > --- a/libmultipath/dict.c
> > > +++ b/libmultipath/dict.c
> > > @@ -1366,6 +1366,39 @@ def_uxsock_timeout_handler(struct config
> > > *conf, vector strvec)
> > >  	return 0;
> > >  }
> > >  
> > > +static int
> > > +hw_vpd_vendor_handler(struct config *conf, vector strvec)
> > > +{
> > > +	int rc = 0;
> > > +	char *buff;
> > > +
> > > +	struct hwentry * hwe = VECTOR_LAST_SLOT(conf->hwtable);
> > > +	if (!hwe)
> > > +		return 1;
> > > +
> > > +	buff = set_value(strvec);
> > > +	if (!buff)
> > > +		return 1;
> > > +	if (strcmp(buff, "hp3par") == 0) {
> > > +		hwe->vpd_vendor_pg = 0xc0;
> > > +		hwe->vpd_vendor_id = VPD_VP_HP3PAR;
> > > +	} else
> > > +		rc = 1;
> > > +	FREE(buff);
> > > +	return rc;
> > > +}
> > > +
> > > +static int
> > > +snprint_hw_vpd_vendor(struct config *conf, char * buff, int len,
> > > +		      const void * data)
> > > +{
> > > +	const struct hwentry * hwe = (const struct hwentry *)data;
> > > +
> > > +	if (hwe->vpd_vendor_pg == 0xc0 && hwe->vpd_vendor_id ==
> > > VPD_VP_HP3PAR)
> > > +		return snprintf(buff, len, "hp3par");
> > > +	return 0;
> > > +}
> > 
> > I don't understand this design. The way you set up the hwe, it
> > would be
> > logical to add "vpd_vendor_page" and "vpd_vendor_id" properties for
> > device entries.
> 
> The vpd page abbreviations specify both the page to read, and the
> vendor
> id to use to decode it, and they are more user readable. It seemed
> like
> a much more foolproof way to have people specify this.
>  
> > BUT ok, that's overengineered with just one supported combination
> > of
> > page and vendor. I can understand that. But then, it seems also
> > overengineered to carry around vpd_vendor_pg and vpd_vendor_id in
> > the
> > hwe. 
> > 
> > I'd suggest creating a hard-coded table with "vendor vpd schemes",
> > 
> > struct {
> > 	int pg;
> > 	int vendor_id;
> > 	const char *name;
> > } vendor_vpd_schemes[]  = { 
> >     { 0xc0, VPD_VP_HP3PAR, "hp3par", }, 
> >     { 0, }, 
> > };
> > 
> > and in the hwentry, only carry around the index into this table,
> > and look up the page and vendor ID there. Actually, with just that
> > single user, we might as well not introduce a new device property
> > at
> > all, but simply use a separate hardcoded table with lookup values
> > for
> > vendor and product ID. I'm unsure if it's wise to make this
> > configurable via multipath.conf.
> 
> Sure. I can make the hwe change. The reason why I added this to
> multipath.conf is that I'm not sure what devices actually support
> these
> vpd information pages.  So, if we miss one, or a new device comes out
> that isn't in the built-in config, the user can still get this info.
> 

My main issue was that you have 2 fields in struct hwentry, and only
one field in the hwtable. I think I made the point that I'd prefer to
have only one everywhere, and use some sort of lookup table for the
page and vendor ID parameters.

Another issue that I realized just now, the "vendor_id" is not
standardized - it's just an internal identifier used by sg3_utils and
has no specific meaning outside the sg3_utils code base. Even it's
numeric value has changed between sg3_utils versions. I think we should
cast it away, and simply stick with the symbolic identifier. Keeping
that symbolic name in line with sg3_utils makes a lot of sense, of
course.

Regards,
Martin



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

