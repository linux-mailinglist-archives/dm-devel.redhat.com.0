Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B0482170
	for <lists+dm-devel@lfdr.de>; Mon,  5 Aug 2019 18:14:58 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 403DF12BB;
	Mon,  5 Aug 2019 16:14:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C61E9608C1;
	Mon,  5 Aug 2019 16:14:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 368D72551C;
	Mon,  5 Aug 2019 16:14:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x75GEGsw026297 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 5 Aug 2019 12:14:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8CD1D5DA8D; Mon,  5 Aug 2019 16:14:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B5E9117D32;
	Mon,  5 Aug 2019 16:14:13 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id x75GECY6020642; 
	Mon, 5 Aug 2019 11:14:12 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id x75GEBWg020641;
	Mon, 5 Aug 2019 11:14:11 -0500
Date: Mon, 5 Aug 2019 11:14:11 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Martin Wilck <Martin.Wilck@suse.com>
Message-ID: <20190805161411.GS3251@octiron.msp.redhat.com>
References: <20190702220911.16157-1-martin.wilck@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190702220911.16157-1-martin.wilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH] libmultipath: trigger uevents for partitions,
	too
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Mon, 05 Aug 2019 16:14:57 +0000 (UTC)

On Tue, Jul 02, 2019 at 10:09:42PM +0000, Martin Wilck wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> We have added code to re-trigger uevents in various cases where
> the status of a device changes from multipath to non-multipath,
> or vice-versa. When multipathd triggers uevents for paths of a map
> because the status of the map has changed, it needs to trigger
> events for the partitions of the path devices, too. The kernel
> doesn't do this automatically.
> 
> Fixes: c5023200 libmultipath: indicate wwid failure in dm_addmap_create()
> Fixes: e5d3c3a0 libmultipath: trigger change uevent on new device creation
> Signed-off-by: Martin Wilck <mwilck@suse.com>

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>

> ---
>  libmultipath/configure.c | 38 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/libmultipath/configure.c b/libmultipath/configure.c
> index af4d78de..9f100008 100644
> --- a/libmultipath/configure.c
> +++ b/libmultipath/configure.c
> @@ -519,6 +519,42 @@ trigger_udev_change(const struct multipath *mpp)
>  	udev_device_unref(udd);
>  }
>  
> +static void trigger_partitions_udev_change(struct udev_device *dev,
> +					   const char *action, int len)
> +{
> +	struct udev_enumerate *part_enum;
> +	struct udev_list_entry *item;
> +
> +	part_enum = udev_enumerate_new(udev);
> +	if (!part_enum)
> +		return;
> +
> +	if (udev_enumerate_add_match_parent(part_enum, dev) < 0 ||
> +	    udev_enumerate_add_match_subsystem(part_enum, "block") < 0 ||
> +	    udev_enumerate_scan_devices(part_enum) < 0)
> +		goto unref;
> +
> +	udev_list_entry_foreach(item,
> +				udev_enumerate_get_list_entry(part_enum)) {
> +		const char *syspath;
> +		struct udev_device *part;
> +
> +		syspath = udev_list_entry_get_name(item);
> +		part = udev_device_new_from_syspath(udev, syspath);
> +		if (!part)
> +			continue;
> +
> +		if (!strcmp("partition", udev_device_get_devtype(part))) {
> +			condlog(4, "%s: triggering %s event for %s", __func__,
> +				action, syspath);
> +			sysfs_attr_set_value(part, "uevent", action, len);
> +		}
> +		udev_device_unref(part);
> +	}
> +unref:
> +	udev_enumerate_unref(part_enum);
> +}
> +
>  void
>  trigger_paths_udev_change(struct multipath *mpp, bool is_mpath)
>  {
> @@ -569,6 +605,8 @@ trigger_paths_udev_change(struct multipath *mpp, bool is_mpath)
>  				action, pp->dev, is_mpath ? "" : "no ");
>  			sysfs_attr_set_value(pp->udev, "uevent",
>  					     action, strlen(action));
> +			trigger_partitions_udev_change(pp->udev, action,
> +						       strlen(action));
>  		}
>  	}
>  
> -- 
> 2.22.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
