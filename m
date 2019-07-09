Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FD1639A1
	for <lists+dm-devel@lfdr.de>; Tue,  9 Jul 2019 18:43:33 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D3145A6E13;
	Tue,  9 Jul 2019 16:42:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E71705B838;
	Tue,  9 Jul 2019 16:42:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DF228206D1;
	Tue,  9 Jul 2019 16:42:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x69Gexbo018124 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 9 Jul 2019 12:41:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0D3702AFBA; Tue,  9 Jul 2019 16:40:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C256B5FCA0;
	Tue,  9 Jul 2019 16:40:56 +0000 (UTC)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4C32C2F8BD6;
	Tue,  9 Jul 2019 16:40:46 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id m8so10736855lji.7;
	Tue, 09 Jul 2019 09:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=JA7LFfQSsJgtI+XomtbZxAMsSJFoDpI6tHo68lpC2lQ=;
	b=UAFCnYZ7DpgUvYmZSxocnPdO+BLSwq/O70b/TnEuEnviP/6a7mWa3fqQtdopVjIRF3
	KcrgL9oH98xTpX7ZQf8B+77dqRdfABSDq7bdv106JRZ2UKSUT8BqYzYwW+m/R76Ksy9p
	ifvTbgWe5WyPwVV/f7jlpCYdh9H5MSQRvTYG7M4RNqZsJkE09/DFN01OzJ92JNGfhaUF
	7NIOEK1HX8PSbyWglnFl6EGx+LfuEnPHjX0RilIaPOrm8Jes/f8S8IbGpwH6c1UomKmx
	dnOoFQntyotEW9kBhJWr2OIgbQW+scwoVWr2SZ1jXb5jun4DbOe0xoMaUZcp3ikz78rl
	482g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JA7LFfQSsJgtI+XomtbZxAMsSJFoDpI6tHo68lpC2lQ=;
	b=SDCMZufciKWeojO+f5U4FiUNP2WHzSvkRs002F/hpL0oDe6qmFaqWrwTwifHJ4HiSZ
	8dYX0+BwbWIxz1+3zH2hzPYQOLV30DX0Z2tG5HBhA/tc75lmoByabY/CRgBsm+QehcXX
	xvv0g4lNInsFE+bNW8Ax5S1/EYaG/1EPWY0Q56fHS94TPrHn+TBkVynV2DB3cHiyvO/2
	fjsLOSLTplC5NbwrQNX0udHTiyB4LiIj+Y/5TlnrxSSUvuw99Xw7euTKCN3CcZpc9GK6
	13s8YZ/8s2zBNorbgQH91YHskGr75IlczGGODDdpTCf7/N0HR+oY5aFy1Ekk8C3it0dR
	21pw==
X-Gm-Message-State: APjAAAWf/prJjaNfBdYDOGb8FLwhDeGpx6yg7Qmu9R+7jwe4ufhmvKth
	Y0eZXb3IBJzni78WN0Mt2zEApUtIF/EqPTo7Oc7tSmaM
X-Google-Smtp-Source: APXvYqyUmHnJub3GLRwK4oqoKWqFhtOSwUQj/k7/XdGPBpFCchUQKQdM2DTN2l/OObmKLNx3kU28maC7OG9XshUE6ew=
X-Received: by 2002:a2e:92c6:: with SMTP id k6mr14508148ljh.148.1562690444682; 
	Tue, 09 Jul 2019 09:40:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190709073909.32112-1-martin.wilck@suse.com>
	<20190709073909.32112-5-martin.wilck@suse.com>
In-Reply-To: <20190709073909.32112-5-martin.wilck@suse.com>
From: Roger Heflin <rogerheflin@gmail.com>
Date: Tue, 9 Jul 2019 11:40:33 -0500
Message-ID: <CAAMCDeeC31_C_4_CWXucmA2zeTvVqig3CsUmikfuuJA1V5YWRg@mail.gmail.com>
To: Martin Wilck <Martin.Wilck@suse.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 09 Jul 2019 16:40:46 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]);
	Tue, 09 Jul 2019 16:40:46 +0000 (UTC) for IP:'209.85.208.193'
	DOMAIN:'mail-lj1-f193.google.com'
	HELO:'mail-lj1-f193.google.com' FROM:'rogerheflin@gmail.com'
	RCPT:''
X-RedHat-Spam-Score: 1.194 * (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, PDS_NO_HELO_DNS, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.208.193 mail-lj1-f193.google.com 209.85.208.193
	mail-lj1-f193.google.com <rogerheflin@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.38
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 4/4] libmultipath: trigger uevents for
 partitions, too
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Tue, 09 Jul 2019 16:43:32 +0000 (UTC)

We have an observed behavior as follows:

When the host boots up, a uuid symbolic link is created pointing at
/dev/sda1 (device for /boot)

Multipath starts up and creates an multipath device to manage /dev/sda
and a udev rule deletes /dev/sda1 invalidating the symbolic link.

The symbolic link does not appear to get re-created to point to the
new multipath device which would lead one to suspect that there was no
event happening for when the multipath device is created.

When /boot attempts to mount via uuid it fails as the symbolic link is
still pointing at /dev/sda1 that no longer exists in /dev.

Right now our solution is a manual solution of blacklisting the device
with /boot on it.

Would this fix triggering an event on the multipath device partitions
be expected to correct the above issue?

If so, I will submit a ticket to our OS vendor to have it backport it
into the versions that are having the issue with.

Thanks.

On Tue, Jul 9, 2019 at 2:42 AM Martin Wilck <Martin.Wilck@suse.com> wrote:
>
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
> ---
>  libmultipath/configure.c | 38 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>
> diff --git a/libmultipath/configure.c b/libmultipath/configure.c
> index b09ef529..4cdf1363 100644
> --- a/libmultipath/configure.c
> +++ b/libmultipath/configure.c
> @@ -519,6 +519,42 @@ trigger_udev_change(const struct multipath *mpp)
>         udev_device_unref(udd);
>  }
>
> +static void trigger_partitions_udev_change(struct udev_device *dev,
> +                                          const char *action, int len)
> +{
> +       struct udev_enumerate *part_enum;
> +       struct udev_list_entry *item;
> +
> +       part_enum = udev_enumerate_new(udev);
> +       if (!part_enum)
> +               return;
> +
> +       if (udev_enumerate_add_match_parent(part_enum, dev) < 0 ||
> +           udev_enumerate_add_match_subsystem(part_enum, "block") < 0 ||
> +           udev_enumerate_scan_devices(part_enum) < 0)
> +               goto unref;
> +
> +       udev_list_entry_foreach(item,
> +                               udev_enumerate_get_list_entry(part_enum)) {
> +               const char *syspath;
> +               struct udev_device *part;
> +
> +               syspath = udev_list_entry_get_name(item);
> +               part = udev_device_new_from_syspath(udev, syspath);
> +               if (!part)
> +                       continue;
> +
> +               if (!strcmp("partition", udev_device_get_devtype(part))) {
> +                       condlog(4, "%s: triggering %s event for %s", __func__,
> +                               action, syspath);
> +                       sysfs_attr_set_value(part, "uevent", action, len);
> +               }
> +               udev_device_unref(part);
> +       }
> +unref:
> +       udev_enumerate_unref(part_enum);
> +}
> +
>  void
>  trigger_paths_udev_change(struct multipath *mpp, bool is_mpath)
>  {
> @@ -569,6 +605,8 @@ trigger_paths_udev_change(struct multipath *mpp, bool is_mpath)
>                                 action, pp->dev, is_mpath ? "" : "no ");
>                         sysfs_attr_set_value(pp->udev, "uevent",
>                                              action, strlen(action));
> +                       trigger_partitions_udev_change(pp->udev, action,
> +                                                      strlen(action));
>                 }
>         }
>
> --
> 2.22.0
>
>
> --
> dm-devel mailing list
> dm-devel@redhat.com
> https://www.redhat.com/mailman/listinfo/dm-devel

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
