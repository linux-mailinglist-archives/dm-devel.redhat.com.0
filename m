Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E46ACAE28
	for <lists+dm-devel@lfdr.de>; Thu,  3 Oct 2019 20:29:00 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 88C4E10DCC8F;
	Thu,  3 Oct 2019 18:28:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1690210018FF;
	Thu,  3 Oct 2019 18:28:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6DFA218005A0;
	Thu,  3 Oct 2019 18:28:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x93ISFYj003453 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 3 Oct 2019 14:28:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2E86C601B7; Thu,  3 Oct 2019 18:28:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9255A600CD;
	Thu,  3 Oct 2019 18:28:12 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7AC5B3084248;
	Thu,  3 Oct 2019 18:28:11 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id r19so3024418wmh.2;
	Thu, 03 Oct 2019 11:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:subject:to:message-id:date:mime-version:content-language
	:content-transfer-encoding;
	bh=DUftnjGKNYkbiSKeoBnp0aipAwPq0JjZhdCQ+uWJpmU=;
	b=F76IVgv0s93FFsAB+TTTOplzC5T0vs9BmqlljykbEG6YtfwlB9gW0lk1Ngw71hib1y
	e3O8NxkeuB82oYn1TiwlwLNGsaaAlfK5kfY0TUOEANE/rp6WLDDGnrLz/fhypXIZAw4A
	i7ryHmFaaEKjIAiQw3MKqqYhXouDAyQH7Qx7CrMmHzIa8zsMd/9RPwDOLiLUG/oIy6hB
	2QJNiogExIDYGaX4WFhNziYCzwh9YZvF+U6mA9KmPqLUn6zsCyT0nb5xxegBiZ0GEfYb
	swZTWUy+AxOzJOj3M/KKfrjoIOSDPMRQzIzAwxQBDJxZeM7p4FsJmtO8P6tBBsKCF42I
	N+xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:message-id:date:mime-version
	:content-language:content-transfer-encoding;
	bh=DUftnjGKNYkbiSKeoBnp0aipAwPq0JjZhdCQ+uWJpmU=;
	b=LqF8krvnZjhf//nEntxgjBUQo1MiNt8NQDM+/l6oSR2VMAvOY3wTol9H2btmikkBsV
	tt2Rjb62eNOQl0G+rQIYAFOHiBhUqj3vFtJqpOggsBFgJz81kF1v/P8o7ahwnu1G0nJ+
	tJlG67ANcwHjm8xCUaWWkrjCDaRqTGy3c3LimNgkGgZvTL0P4QZe+fcKUMYULLika91B
	OQ8p1JXUQ9tbsoEBgtESHYyfMEPZkake7BBvHLn18/kR98uqMAbVVRmkWx5lDC7v1Xxv
	LZQCLtrgo7XWJv5xMR4b1jADk5VcN1Az/NvopccCndR7nES24dBBykEWxLktJjdWUSad
	vAsQ==
X-Gm-Message-State: APjAAAU9zd21y9mMaFToLLJXSVJgHgCmhJ9i6PVj7yt3FXu7vk+HOH8P
	FEoxcSCrDyfVhD6acGkl3tllW1A=
X-Google-Smtp-Source: APXvYqygtiP7A7bOOnzk3M+QFmLKctWLAEKvlfmOgeTvMIJlZiifnXuyY7rx5kKJc4SkgHmZO7nqcA==
X-Received: by 2002:a1c:658b:: with SMTP id z133mr8081646wmb.130.1570127289717;
	Thu, 03 Oct 2019 11:28:09 -0700 (PDT)
Received: from localhost (118.red-88-12-24.staticip.rima-tde.net.
	[88.12.24.118])
	by smtp.gmail.com with ESMTPSA id f8sm3073737wmb.37.2019.10.03.11.28.08
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 03 Oct 2019 11:28:09 -0700 (PDT)
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
To: Benjamin Marzinski <bmarzins@redhat.com>, Martin Wilck <mwilck@suse.com>, 
	DM-DEVEL ML <dm-devel@redhat.com>
Message-ID: <e2b955d0-69ea-2c2b-9f0f-ccf3b5f369d0@gmail.com>
Date: Thu, 3 Oct 2019 20:28:06 +0200
MIME-Version: 1.0
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Thu, 03 Oct 2019 18:28:11 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Thu, 03 Oct 2019 18:28:11 +0000 (UTC) for IP:'209.85.128.45'
	DOMAIN:'mail-wm1-f45.google.com' HELO:'mail-wm1-f45.google.com'
	FROM:'xose.vazquez@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.128.45 mail-wm1-f45.google.com 209.85.128.45
	mail-wm1-f45.google.com <xose.vazquez@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Subject: [dm-devel] multipath-tools: RH-patches for upstream ???
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.64]); Thu, 03 Oct 2019 18:28:59 +0000 (UTC)

Hi Benjamin,


Is there any relevant RH-patch for upstream in fedora repo:
https://src.fedoraproject.org/rpms/device-mapper-multipath/ ???

Maybe:

- https://src.fedoraproject.org/rpms/device-mapper-multipath/blob/master/f/0022-RH-Remove-the-property-blacklist-exception-builtin.patch

    Subject: [PATCH] RH: Remove the property blacklist exception builtin

     Multipath set the default property blacklist exceptions to	
     (ID_SCSI_VPD|ID_WWN).  This has the effect of blacklisting some internal
     devices.  These devices may never have multiple paths, but it is nice
     to be able to set multipath up on them all the same.  This patch simply
     removes the default, and makes it so that if no property
     blacklist_exception is given, then devices aren't failed for not matching
     it.


- https://src.fedoraproject.org/rpms/device-mapper-multipath/blob/master/f/0026-RH-add-wwids-from-kernel-cmdline-mpath.wwids-with-A.patch

    Subject: [PATCH] RH: add wwids from kernel cmdline mpath.wwids with -A

     This patch adds another option to multipath, "-A", which reads
     /proc/cmdline for mpath.wwid=<WWID> options, and adds any wwids it finds
     to /etc/multipath/wwids.  While this isn't usually important during
     normal operation, since these wwids should already be added, it can be
     helpful during installation, to make sure that multipath can claim
     devices as its own, before LVM or something else makes use of them.  The
     patch also execs "/sbin/multipath -A" before running multipathd in
     multipathd.service


- https://src.fedoraproject.org/rpms/device-mapper-multipath/blob/master/f/0027-RH-warn-on-invalid-regex-instead-of-failing.patch

    Subject: [PATCH] RH: warn on invalid regex instead of failing

     multipath.conf used to allow "*" as a match everything regular expression,
     instead of requiring ".*". Instead of erroring when the old style
     regular expressions are used, it should print a warning and convert
     them.


- https://src.fedoraproject.org/rpms/device-mapper-multipath/blob/master/f/0028-RH-reset-default-find_mutipaths-value-to-off.patch

    Subject: [PATCH] RH: reset default find_mutipaths value to off

     Upstream has changed to default find_multipaths to "strict". For now
     Redhat will retain the previous default of "off".


- https://src.fedoraproject.org/rpms/device-mapper-multipath/blob/master/f/0029-RH-Fix-nvme-compilation-warning.patch

    Subject: [PATCH] RH: Fix nvme compilation warning


- https://src.fedoraproject.org/rpms/device-mapper-multipath/blob/master/f/0030-RH-attempt-to-get-ANA-info-via-sysfs-first.patch

    Subject: [PATCH] RH: attempt to get ANA info via sysfs first

     When the ANA prioritizer is run, first see if the "ana_state" sysfs file
     exists, and if it does, try to read the state from there. If that fails,
     fallback to using an ioctl.


Thank you.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
