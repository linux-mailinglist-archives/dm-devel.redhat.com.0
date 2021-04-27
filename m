Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7C4A936CC7D
	for <lists+dm-devel@lfdr.de>; Tue, 27 Apr 2021 22:44:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1619556244;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=I5R+AIvTxNMUm9y5uKWdAtxIfha2VTz1ofxGFDzx5TQ=;
	b=FFPn3l/ruxidOtTDFWWtN6JpC0eEZmP/75t40xERB+4HTqDOjyaLbUI35wvJ0YGnELCY1f
	soeKybXmZYfZieEj4u7X8+3q76s6QNU0l5bj/cNsOg4XgYKJdhZ7bl9MGgAYjDFB2shOCN
	g0Z7gKTJcRNzjB4Lvn/fv5dODcsuiKQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-UDIzc8TaMA2ot8VippBigQ-1; Tue, 27 Apr 2021 16:44:01 -0400
X-MC-Unique: UDIzc8TaMA2ot8VippBigQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B09A1935780;
	Tue, 27 Apr 2021 20:43:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8034F19C45;
	Tue, 27 Apr 2021 20:43:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1205018095C9;
	Tue, 27 Apr 2021 20:43:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13RKfod7031571 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 27 Apr 2021 16:41:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id ACAAC1037E8A; Tue, 27 Apr 2021 20:41:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from ovpn-112-203.phx2.redhat.com (ovpn-112-203.phx2.redhat.com
	[10.3.112.203])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3C65C100763B;
	Tue, 27 Apr 2021 20:41:46 +0000 (UTC)
Message-ID: <c8ede601244e1710dbf320c33c0f7853e249bbee.camel@redhat.com>
From: "Ewan D. Milne" <emilne@redhat.com>
To: Martin Wilck <martin.wilck@suse.com>,
	"Ulrich.Windl@rz.uni-regensburg.de" <Ulrich.Windl@rz.uni-regensburg.de>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>
Date: Tue, 27 Apr 2021 16:41:45 -0400
In-Reply-To: <488ef3e7fa0cca4f0a0cb2e9307ddaa08385d3f7.camel@suse.com>
References: <c524ce68d9a9582732db8350f8a1def461a1a847.camel@suse.com>
	<yq135w4cam3.fsf@ca-mkp.ca.oracle.com>
	<06489ea37311fe7bf73b27a41b5209ee4cca85fe.camel@suse.com>
	<yq1pmynt6f6.fsf@ca-mkp.ca.oracle.com>
	<685c40341d2ddef2fe5a54dd656d10104b0c1bfa.camel@suse.com>
	<yq1im4dre94.fsf@ca-mkp.ca.oracle.com>
	<e3184501cbf23ab0ae94d664725e72b693c64ba9.camel@suse.com>
	<6086A0B2020000A100040BBE@gwsmtp.uni-regensburg.de>
	<59dc346de26997a6b8e3ae3d86d84ada60b3d26b.camel@suse.com>
	<65f66a5e03081dd3b470fa9aeff9a77dbc41743c.camel@redhat.com>
	<488ef3e7fa0cca4f0a0cb2e9307ddaa08385d3f7.camel@suse.com>
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 2021-04-27 at 20:33 +0000, Martin Wilck wrote:
> On Tue, 2021-04-27 at 16:14 -0400, Ewan D. Milne wrote:
> > 
> > There's no way to do that, in principle.  Because there could be
> > other I/Os in flight.  You might (somehow) avoid retrying an I/O
> > that got a UA until you figured out if something changed, but other
> > I/Os can already have been sent to the target, or issued before you
> > get to look at the status.
> 
> Right. But in practice, a WWID change will hardly happen under full
> IO
> load. The storage side will probably have to block IO while this
> happens, at least for a short time period. So blocking and quiescing
> the queue upon an UA might still work, most of the time. Even if we
> were too late already, the sooner we stop the queue, the better.
> 
> The current algorithm in multipath-tools needs to detect a path going
> down and being reinstated. The time interval during which a WWID
> change
> will go unnoticed is one or more path checker intervals, typically on
> the order of 5-30 seconds. If we could decrease this interval to a
> sub-
> second or even millisecond range by blocking the queue in the kernel
> quickly, we'd have made a big step forward.

Yes, and in many situations this may help.  But in the general case
we can't protect against a storage array misconfiguration,
where something like this can happen.  So I worry about people
believing the host software will protect them against a mistake,
when we can't really do that.

All it takes is one I/O (a discard) to make a thorough mess of the LUN.

-Ewan

> 
> Regards
> Martin
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

