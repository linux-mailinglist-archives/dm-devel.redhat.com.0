Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 420D41F1BA7
	for <lists+dm-devel@lfdr.de>; Mon,  8 Jun 2020 17:05:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591628728;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0uNTiW7qIwznSVYUKUU33QqAnUMNTGyoEBy1stSNOlo=;
	b=Peq/91wrUL2MGoUyvFV0wtR50wQ8oC2Ze/7wiLKtrLg9iIYPbeV03dwHiaVPaHWYScJ0W0
	0GDVyQUNI+b/PxZz+m3qb+iM0EKdYrFwE64Atve82cMrxdo71g8f2fNHP1XoB9/fypdUhW
	5+7YU0tNKxNAE7if/k5OoV9/3wgOtYw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95-8Xh_turSMU61EQXtu5eZcQ-1; Mon, 08 Jun 2020 11:05:22 -0400
X-MC-Unique: 8Xh_turSMU61EQXtu5eZcQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 163B4805731;
	Mon,  8 Jun 2020 15:05:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A1AB1648DB;
	Mon,  8 Jun 2020 15:05:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 43F999702B;
	Mon,  8 Jun 2020 15:05:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 058F4YrF004587 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 8 Jun 2020 11:04:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F3E7B5D9C9; Mon,  8 Jun 2020 15:04:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E413C5D9F3;
	Mon,  8 Jun 2020 15:04:28 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 058F4REp017018; 
	Mon, 8 Jun 2020 10:04:27 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 058F4QMK017017;
	Mon, 8 Jun 2020 10:04:26 -0500
Date: Mon, 8 Jun 2020 10:04:26 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <Martin.Wilck@suse.com>
Message-ID: <20200608150426.GC5894@octiron.msp.redhat.com>
References: <1591317060-25484-1-git-send-email-bmarzins@redhat.com>
	<9db7560136de15dad358e2832f236ae131e145ef.camel@suse.com>
	<20200605222730.GB5894@octiron.msp.redhat.com>
	<3442de794faf5c0d1efc7fd95e4fc0e968bbc5e1.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <3442de794faf5c0d1efc7fd95e4fc0e968bbc5e1.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	"nkshirsa@redhat.com" <nkshirsa@redhat.com>
Subject: Re: [dm-devel] [RFC PATCH 0/2] multipath: change default devnode
	blacklist
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Sat, Jun 06, 2020 at 07:23:28PM +0000, Martin Wilck wrote:
> On Fri, 2020-06-05 at 17:27 -0500, Benjamin Marzinski wrote:
> > On Fri, Jun 05, 2020 at 07:20:26PM +0000, Martin Wilck wrote:
> > > Hi Ben,
> > >=20
> > > On Thu, 2020-06-04 at 19:30 -0500, Benjamin Marzinski wrote:
> > > > I recently got a request to add the Oracle ASM filer driver
> > > > devices
> > > > to
> > > > multipath's builtin devnode blacklist.  However, instead of
> > > > having to
> > > > do
> > > > always this for each device type individually, I decided to make
> > > > multipath blacklist all non scsi, nvme, and dasd devnodes by
> > > > default.
> > > > This is what the multipath udev rules already do. If people don't
> > > > like
> > > > this solution, the alternative is to add another line to the
> > > > default
> > > > devnode blacklist like "^(asm/|oracleafd/|ofsctl)".
> > >=20
> > > Thanks, this looks ok. But I'd like to propose an alternative idea:
> > > Extend the RE syntax in our config file to allow negated regular=20
> > > expressions. Like this:
> > >=20
> > > blacklist {
> > >     devnode "!(^(sd[a-z]|dasd[a-z]|nvme[0-9]))"
> > > }
> > >=20
> > > The "!(${RE})" construct would mean "everything that does not match
> > > ${RE}".
> > > This logic would only be applied to an entire regex.
> > > If a user needs a RE matching with "!(" and ending with ")", she
> > > can escape=20
> > > the exclamation mark "\!(like this)".
> > >=20
> > > AFAICS this could be implemented quite easily (by adding a "bool
> > > negate" field
> > > in struct blentry and some simple parser logic), and could be
> > > applied to other=20
> > > REs in the config file as well. We could print this with "multipath
> > > -t", and=20
> > > we wouldn't need to document an exception.
> > >=20
> > > It's also pretty much backwards-compatible, I don't think many
> > > people use
> > > regexes starting with "!(" for multipath these days.
> >=20
> > Sure, but since we can only really support negating the whole regular
> > expression, and c regular expressions don't treat '!' as a special
> > character, why do we need the prentheses around the regular
> > expression?
> > It seems like we can just treat regular expressions starting with '!'
> > as
> > negated, and ones starting with "\!" as starting with a literal '!'.
> >=20
> > Do you think that there is much chance that users have blacklist
> > strings
> > that start with '!'? There are no devnodes, udev properties, or
> > protocols that start with that.  I don't know of a UUID format that
> > has
> > an exclamation point, and while it's possible that a product string
> > starts with one, it seems really unlikely.
> >=20
>=20
> Sure, just using "!" would be fine, too, and simpler. Does this mean
> you agree with my proposal in general?

yeah. I'll be posting a v2 shortly.

-Ben
=20
> Martin
>=20
> --=20
> Dr. Martin Wilck <mwilck@suse.com>, Tel. +49 (0)911 74053 2107
> SUSE  Software Solutions Germany GmbH
> HRB 36809, AG N=FCrnberg GF: Felix
> Imend=F6rffer
>=20

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

