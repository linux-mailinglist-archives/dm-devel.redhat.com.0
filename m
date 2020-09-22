Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 41539274C11
	for <lists+dm-devel@lfdr.de>; Wed, 23 Sep 2020 00:28:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600813723;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oh/mBw3iQ8HYjQXIRAclIReqEWWL3Zt7DAKXDm5SqjM=;
	b=ZsOWKGKKuibuFQSHmUOAb2uFeh8oj7o19Xis8jHZ5PsIxdpT9DxfUbC3dkjpZrXLHOtAHq
	3eU85QC3Nm9IFuBeG/uNWR2e5/pX5Z+hIeVYlGVYyN83rmQUhUegAdbxb1ShiGmDZnC69/
	83cWWlEqeIEUd6moAS9hXyMRMRqp6rY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-uprj-79fN9e59cg51gMdlw-1; Tue, 22 Sep 2020 18:28:41 -0400
X-MC-Unique: uprj-79fN9e59cg51gMdlw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E63F6801AE8;
	Tue, 22 Sep 2020 22:28:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B19378810;
	Tue, 22 Sep 2020 22:28:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5632E44A46;
	Tue, 22 Sep 2020 22:28:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08MMRWxD029505 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 22 Sep 2020 18:27:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EBAF85C1D0; Tue, 22 Sep 2020 22:27:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 733B15C1A3;
	Tue, 22 Sep 2020 22:27:29 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 08MMRR64008840; 
	Tue, 22 Sep 2020 17:27:28 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 08MMRQTF008839;
	Tue, 22 Sep 2020 17:27:26 -0500
Date: Tue, 22 Sep 2020 17:27:26 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <mwilck@suse.com>
Message-ID: <20200922222726.GC11108@octiron.msp.redhat.com>
References: <AM0PR09MB289726B5423506E7A0CBFA47FE3B0@AM0PR09MB2897.eurprd09.prod.outlook.com>
	<42aa1aaf935927e169e27e035fe307fd8181f9a6.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <42aa1aaf935927e169e27e035fe307fd8181f9a6.camel@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: Frank Meinl <frank.meinl@live.de>, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] libmultipath: Allow discovery of USB devices
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Sep 22, 2020 at 09:59:36PM +0200, Martin Wilck wrote:
> On Tue, 2020-09-22 at 20:34 +0200, Frank Meinl wrote:
> > This change adds a new configuration option allow_usb_devices. It is
> > disabled by default, so that the behavior of existing setups is not
> > changed. If enabled (via multipath.conf), USB devices will be found
> > during device discovery and can be used for multipath setups.
> > 
> > Without this option, multipath currently ignores all USB drives,
> > which
> > is convenient for most users. (refer also to commit 51957eb)
> > 
> > However, it can be beneficial to use the multipath dm-module even if
> > there is only a single path to an USB attached storage. In
> > combination
> > with the option 'queue_if_no_path', such a setup survives a temporary
> > device disconnect without any severe consequences for the running
> > applications. All I/O is queued until the device reappears.
> 
> Hm. So you want to use multipath just to enable queueing?
> I wonder if that can't be achieved some other way; multipath seems to
> be quite big hammer for this nail. Anyway, I don't think this would
> hurt us, so I don't have good reasons to reject it.
> 
> Waiting for others' opinions.

I've actually seen other cases where people are using multipath on
single path devices just for the queuing, and when I thought about it, I
realized that it makes sense. Multipath works with devices as they are,
instead of needing special metadata, like lvm devices. People often
realize that they need this after the device is already set up. Plus,
multipath already deals with devices that have partitions or logical
volumes on top of them. It's also easy to configure exactly how you want
queueing to work. This use case might be a small nail, but it is a nail,
and multipath is a reasonable tool to get the job done.

It doesn't seem too hard to write a dm target that would queue and retry
IO at some configurable interval, for some configurable number of times,
when it failed. But you would also need to copy the work for getting the
device, and any partitons on it, to autoassemble after the frist time
it's set up and to make sure other layers use this device instead of the
underlying device. Or, people can just use multipath.

-Ben

> > 
> > Signed-off-by: Frank Meinl <frank.meinl@live.de>
> > ---
> >  libmultipath/config.h      |  1 +
> >  libmultipath/dict.c        |  4 ++++
> >  libmultipath/discovery.c   | 13 ++++++++++---
> >  libmultipath/structs.h     |  1 +
> >  multipath/multipath.conf.5 | 14 ++++++++++++++
> >  5 files changed, 30 insertions(+), 3 deletions(-)
> > 
> > diff --git a/libmultipath/config.h b/libmultipath/config.h
> > index 2bb7153b..290aea58 100644
> > --- a/libmultipath/config.h
> > +++ b/libmultipath/config.h
> > @@ -158,6 +158,7 @@ struct config {
> >  	unsigned int dev_loss;
> >  	int log_checker_err;
> >  	int allow_queueing;
> > +	int allow_usb_devices;
> >  	int find_multipaths;
> >  	uid_t uid;
> >  	gid_t gid;
> > diff --git a/libmultipath/dict.c b/libmultipath/dict.c
> > index feabae56..f12c2e5c 100644
> > --- a/libmultipath/dict.c
> > +++ b/libmultipath/dict.c
> > @@ -543,6 +543,9 @@ snprint_def_queue_without_daemon (struct config
> > *conf,
> >  declare_def_handler(checker_timeout, set_int)
> >  declare_def_snprint(checker_timeout, print_nonzero)
> >  
> > +declare_def_handler(allow_usb_devices, set_yes_no)
> > +declare_def_snprint(allow_usb_devices, print_yes_no)
> > +
> >  declare_def_handler(flush_on_last_del, set_yes_no_undef)
> >  declare_def_snprint_defint(flush_on_last_del, print_yes_no_undef,
> > DEFAULT_FLUSH)
> >  declare_ovr_handler(flush_on_last_del, set_yes_no_undef)
> > @@ -1759,6 +1762,7 @@ init_keywords(vector keywords)
> >  	install_keyword("no_path_retry", &def_no_path_retry_handler,
> > &snprint_def_no_path_retry);
> >  	install_keyword("queue_without_daemon",
> > &def_queue_without_daemon_handler,
> > &snprint_def_queue_without_daemon);
> >  	install_keyword("checker_timeout",
> > &def_checker_timeout_handler, &snprint_def_checker_timeout);
> > +	install_keyword("allow_usb_devices",
> > &def_allow_usb_devices_handler, &snprint_def_allow_usb_devices);
> >  	install_keyword("pg_timeout", &deprecated_handler,
> > &snprint_deprecated);
> >  	install_keyword("flush_on_last_del",
> > &def_flush_on_last_del_handler, &snprint_def_flush_on_last_del);
> >  	install_keyword("user_friendly_names",
> > &def_user_friendly_names_handler, &snprint_def_user_friendly_names);
> > diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
> > index 2f301ac4..4b615caa 100644
> > --- a/libmultipath/discovery.c
> > +++ b/libmultipath/discovery.c
> > @@ -375,11 +375,10 @@ sysfs_get_tgt_nodename(struct path *pp, char
> > *node)
> >  	while (tgtdev) {
> >  		value = udev_device_get_subsystem(tgtdev);
> >  		if (value && !strcmp(value, "usb")) {
> > -			pp->sg_id.proto_id = SCSI_PROTOCOL_UNSPEC;
> > +			pp->sg_id.proto_id = SCSI_PROTOCOL_UAS;
> 
> How do you know this is UAS? It could as well be usb-storage, no?
> Maybe we need not differentiate the two, but asserting UAS here
> might raise wrong expectations. Maybe you should just call it
> SCSI_PROTOCOL_USB.
> 
> >  			tgtname = udev_device_get_sysname(tgtdev);
> >  			strlcpy(node, tgtname, NODE_NAME_SIZE);
> > -			condlog(3, "%s: skip USB device %s", pp->dev,
> > node);
> > -			return 1;
> > +			return 0;
> >  		}
> >  		tgtdev = udev_device_get_parent(tgtdev);
> >  	}
> > @@ -2136,6 +2135,14 @@ int pathinfo(struct path *pp, struct config
> > *conf, int mask)
> >  
> >  		if (rc != PATHINFO_OK)
> >  			return rc;
> > +
> > +		if (pp->bus == SYSFS_BUS_SCSI &&
> > +		    pp->sg_id.proto_id == SCSI_PROTOCOL_UAS &&
> > +		    !conf->allow_usb_devices) {
> > +			condlog(3, "%s: skip USB device %s", pp->dev,
> > +				pp->tgt_node_name);
> > +			return PATHINFO_SKIPPED;
> > +		}
> >  	}
> >  
> >  	if (mask & DI_BLACKLIST && mask & DI_SYSFS) {
> > diff --git a/libmultipath/structs.h b/libmultipath/structs.h
> > index 4afd3e88..284c1e45 100644
> > --- a/libmultipath/structs.h
> > +++ b/libmultipath/structs.h
> > @@ -174,6 +174,7 @@ enum scsi_protocol {
> >  	SCSI_PROTOCOL_SAS = 6,
> >  	SCSI_PROTOCOL_ADT = 7,	/* Media Changers */
> >  	SCSI_PROTOCOL_ATA = 8,
> > +	SCSI_PROTOCOL_UAS = 9,  /* USB Attached SCSI */
> >  	SCSI_PROTOCOL_UNSPEC = 0xf, /* No specific protocol */
> >  };
> >  
> > diff --git a/multipath/multipath.conf.5 b/multipath/multipath.conf.5
> > index 5adaced6..21b3bfb6 100644
> > --- a/multipath/multipath.conf.5
> > +++ b/multipath/multipath.conf.5
> > @@ -643,6 +643,20 @@ The default is: in
> > \fB/sys/block/sd<x>/device/timeout\fR
> >  .
> >  .
> >  .TP
> > +.B allow_usb_devices
> > +If set to
> > +.I no
> > +, all USB devices will be skipped during path discovery. This is
> > convenient
> > +for most users, as it effectively hides all attached USB disks and
> > flash
> > +drives from the multipath application. However, if you intend to use
> > multipath
> > +on USB attached devices, set this to \fIyes\fR.
> > +.RS
> > +.TP
> > +The default is: \fBno\fR
> 
> All factual information in the middle sentence ("This is convenient ...
> application") is already present elsewhere. Drop the sentence, please,
> and drop the "however," too.
> 
> Martin
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

