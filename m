Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 163FF36CC38
	for <lists+dm-devel@lfdr.de>; Tue, 27 Apr 2021 22:15:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1619554529;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=j4xgauh98AFoKHSSiF+JESHDpA5C9Q/QHvHrEHMF07M=;
	b=JjBI5/+67n7CQRtbiR63DJHtrDmeL65RvI7pltwYdiQhYpQ9MoIlUsDG5FO9T6klaS5deu
	eaeJqyKNet9679ASMuRo3pPDXyqG2qRz7TsA9KxDFYdGRsCHwjjpuGOufzVdm11OeFKcZW
	doQqqO/3epplATXdQhumOBuDkBo6nHI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-o2SPxVlBPIucRTtJrnpOtw-1; Tue, 27 Apr 2021 16:15:26 -0400
X-MC-Unique: o2SPxVlBPIucRTtJrnpOtw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9026081840E;
	Tue, 27 Apr 2021 20:15:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AAB0F6060F;
	Tue, 27 Apr 2021 20:15:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E883344A58;
	Tue, 27 Apr 2021 20:15:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13RKF5AH029990 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 27 Apr 2021 16:15:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 24FDB5C260; Tue, 27 Apr 2021 20:15:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from ovpn-112-203.phx2.redhat.com (ovpn-112-203.phx2.redhat.com
	[10.3.112.203])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5DED25C3F8;
	Tue, 27 Apr 2021 20:15:00 +0000 (UTC)
Message-ID: <65f66a5e03081dd3b470fa9aeff9a77dbc41743c.camel@redhat.com>
From: "Ewan D. Milne" <emilne@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>,
	"Ulrich.Windl@rz.uni-regensburg.de" <Ulrich.Windl@rz.uni-regensburg.de>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>
Date: Tue, 27 Apr 2021 16:14:59 -0400
In-Reply-To: <59dc346de26997a6b8e3ae3d86d84ada60b3d26b.camel@suse.com>
References: <c524ce68d9a9582732db8350f8a1def461a1a847.camel@suse.com>
	<yq135w4cam3.fsf@ca-mkp.ca.oracle.com>
	<06489ea37311fe7bf73b27a41b5209ee4cca85fe.camel@suse.com>
	<yq1pmynt6f6.fsf@ca-mkp.ca.oracle.com>
	<685c40341d2ddef2fe5a54dd656d10104b0c1bfa.camel@suse.com>
	<yq1im4dre94.fsf@ca-mkp.ca.oracle.com>
	<e3184501cbf23ab0ae94d664725e72b693c64ba9.camel@suse.com>
	<6086A0B2020000A100040BBE@gwsmtp.uni-regensburg.de>
	<59dc346de26997a6b8e3ae3d86d84ada60b3d26b.camel@suse.com>
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: Hannes Reinecke <hare@suse.com>,
	"jejb@linux.vnet.ibm.com" <jejb@linux.vnet.ibm.com>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"dgilbert@interlog.com" <dgilbert@interlog.com>,
	"systemd-devel@lists.freedesktop.org"
	<systemd-devel@lists.freedesktop.org>, "hch@lst.de" <hch@lst.de>
Subject: Re: [dm-devel] RFC: one more time: SCSI device identification
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2021-04-26 at 13:16 +0000, Martin Wilck wrote:
> On Mon, 2021-04-26 at 13:14 +0200, Ulrich Windl wrote:
> > > > 
> > > 
> > > While we're at it, I'd like to mention another issue: WWID
> > > changes.
> > > 
> > > This is a big problem for multipathd. The gist is that the device
> > > identification attributes in sysfs only change after rescanning
> > > the
> > > device. Thus if a user changes LUN assignments on a storage
> > > system,
> > > it can happen that a direct INQUIRY returns a different WWID as
> > > in
> > > sysfs, which is fatal. If we plan to rely more on sysfs for
> > > device
> > > identification in the future, the problem gets worse. 
> > 
> > I think many devices rely on the fact that they are identified by
> > Vendor/model/serial_nr, because in most professional SAN storage
> > systems you
> > can pre-set the serial number to a custom value; so if you want a
> > new
> > disk
> > (maybe a snapshot) to be compatible with the old one, just assign
> > the
> > same
> > serial number. I guess that's the idea behind.
> 
> What you are saying sounds dangerous to me. If a snapshot has the
> same
> WWID as the device it's a snapshot of, it must not be exposed to any
> host(s) at the same time with its origin, otherwise the host may
> happily combine it with the origin into one multipath map, and data
> corruption will almost certainly result. 
> 
> My argument is about how the host is supposed to deal with a WWID
> change if it happens. Here, "WWID change" means that a given H:C:T:L
> suddenly exposes different device designators than it used to, while
> this device is in use by a host. Here, too, data corruption is
> imminent, and can happen in a blink of an eye. To avoid this, several
> things are needed:
> 
>  1) the host needs to get notified about the change (likely by an UA
> of
> some sort)
>  2) the kernel needs to react to the notification immediately, e.g.
> by
> blocking IO to the device,

There's no way to do that, in principle.  Because there could be
other I/Os in flight.  You might (somehow) avoid retrying an I/O
that got a UA until you figured out if something changed, but other
I/Os can already have been sent to the target, or issued before you
get to look at the status.

-Ewan

>  3) userspace tooling such as udev or multipathd need to figure out
> how
> to  how to deal with the situation cleanly, and eventually unblock
> it.
> 
> Wrt 1), we can only hope that it's the case. But 2) and 3) need work,
> afaics.
> 
> Martin
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

