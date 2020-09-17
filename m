Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2B9BA26E983
	for <lists+dm-devel@lfdr.de>; Fri, 18 Sep 2020 01:37:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600385843;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=p23Pejjp5VOtIr278Ayb6i5j8xDb/dH+VxoXIh3TsyQ=;
	b=MMZl9vrp/sIHKxoyQzd+lO+tDZrJdgDfpXKCWV9tx3TUOmx+uiGMFoHyiV5D4duzJAIHmG
	+O2pxIXlmrSBYnEQ6E2cBre6WAFma/+getS5x0lMKHGmp5Dri5bdISWeyfvqHYDssSC94x
	lO8ORcbLA7SBOfiNcxBlr7WbeEuoc/o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-2v1eL0jpPeC1HMFvVHL-rw-1; Thu, 17 Sep 2020 19:37:19 -0400
X-MC-Unique: 2v1eL0jpPeC1HMFvVHL-rw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E20251074661;
	Thu, 17 Sep 2020 23:37:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E77655761;
	Thu, 17 Sep 2020 23:37:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 30D2444A7F;
	Thu, 17 Sep 2020 23:36:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08HNaaKv002264 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 17 Sep 2020 19:36:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9896E1F2; Thu, 17 Sep 2020 23:36:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A6E6560CC0;
	Thu, 17 Sep 2020 23:36:33 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 08HNaW4G023314; 
	Thu, 17 Sep 2020 18:36:32 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 08HNaVQ4023313;
	Thu, 17 Sep 2020 18:36:31 -0500
Date: Thu, 17 Sep 2020 18:36:31 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>
Message-ID: <20200917233631.GS11108@octiron.msp.redhat.com>
References: <1600206312-6497-1-git-send-email-bmarzins@redhat.com>
	<1600206312-6497-4-git-send-email-bmarzins@redhat.com>
	<6442fa8e24eaa44a5487d16de95a712ed9d76125.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <6442fa8e24eaa44a5487d16de95a712ed9d76125.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 3/3] libmultipath: add ignore_udev_uid option
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wed, Sep 16, 2020 at 02:46:18PM +0000, Martin Wilck wrote:
> Hi Ben,
>=20
> On Tue, 2020-09-15 at 16:45 -0500, Benjamin Marzinski wrote:
> > Setting this option to yes will force multipath to get the uid by
> > using
> > the fallback sysfs methods, instead of getting it from udev. This
> > will
> > cause devices that can't get their uid from the standard locations to
> > not get a uid. It will also disable uevent merging.
> >=20
> > It will not stop uevents from being resent for device that failed to
> > get a WWID, although I'm on the fence about the benefit of this.
> >=20
> > Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
>=20
> Can you explain how this differs from setting uid_attribute to the
> empty string (and leaving uid_attrs at the default, empty)?
>=20
> The patch is alright, but the configuration of WWID determination is
> already sooo complicated... I'm not too happy about adding yet another
> option which complicates matters further. IMO we should rather attempt
> to make this easier for users (meaning less options, less combinations
> thereof, and less "x supersedes y but only if z is not set" kind of
> logic). This is not a nack, I just want to understand.

Ummm... Actually, I hadn't thought of using

overrides {
=09uid_attribute ""
}

to test SID.  That works, so this patch is unnecessary. I hope you don't
object to me changing the code to log at level 3 if uid_attribute is
configured to "". In this case, using the fallback methods is
expected, so I don't see a need to log at a higher priority.

-Ben
=20
> Regards
> Martin
>=20
> --
> Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
> SUSE  Software Solutions Germany GmbH
> HRB 36809, AG N=FCrnberg GF: Felix
> Imend=F6rffer
>=20

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

