Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 970211CA605
	for <lists+dm-devel@lfdr.de>; Fri,  8 May 2020 10:27:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588926445;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KCvRk5Y/1E5IvV8eNOXvLo1wLBGTW5rBQdqRQ73iXB0=;
	b=gVxa/Fx/Qzc+yDWVsRFZO/6zQbHrULAOHW0qkNJu3ynP0dAhMjAEAiP6+brLzmrQnobKr3
	b+RBBbEpmcpd4oFYeky0YnbIDZDgXiN3wiEOzqhNEGM3iTToP0zXaQ9jmsOIoke31VQtut
	Al7uvF1xNvXiS2RfZYDHCM3omzY9whY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-1PrPJRWsMHafh5wvoJ6S4Q-1; Fri, 08 May 2020 04:27:22 -0400
X-MC-Unique: 1PrPJRWsMHafh5wvoJ6S4Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB700107ACF8;
	Fri,  8 May 2020 08:27:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B72EA1001925;
	Fri,  8 May 2020 08:27:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 34C8D1809543;
	Fri,  8 May 2020 08:26:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0488Qdpn031251 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 8 May 2020 04:26:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CA3B820267F2; Fri,  8 May 2020 08:26:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C6A96202683D
	for <dm-devel@redhat.com>; Fri,  8 May 2020 08:26:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 93F88185A78B
	for <dm-devel@redhat.com>; Fri,  8 May 2020 08:26:37 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
	[209.85.166.45]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-281-iXPltFxSN_ShnO-BrDwyNw-1; Fri, 08 May 2020 04:26:35 -0400
X-MC-Unique: iXPltFxSN_ShnO-BrDwyNw-1
Received: by mail-io1-f45.google.com with SMTP id w11so1013856iov.8;
	Fri, 08 May 2020 01:26:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=DzNkrLXMkfZyR5EdoJaKHZI7iHOsKEkXwnvcgQTTqSA=;
	b=d9FFg9PdgRKu+JElPFUC2Dxix+f89CIvWIkpvgF4C1J9Xy73MmEfhpkyFmby1Bqmxn
	9+YHsQOh5Jz2Dda7k2Y6XImNv002hJt/FnKRyMW3sb3Ha2I2VXCziQdoxKIg0q09+12T
	LdwvuTIASxr2S4bcL1lUIWLvcEQhkeUAyz/RpCQAN6dLJ8jqKMXW5nrtOGiUQhuy4Vo5
	iyJKwQTpvzK3kXdywArHCGbAoDTC4tcWIm2e6M/NrdrPoW6QkvhhkP6G6uQzLIzq6PtI
	yxiBkUmP/WuklThnEPnvy7hk6mAgq7EVj4/uWnxZHBmf+4g9VfO5PWbiWamPGSQRGrfU
	fPJg==
X-Gm-Message-State: AGi0PuawqxgyUxCqAToDdUkhvpyBxdqxd/zlKQMUGORh01fou/KH2eQR
	jLssx+hhuMxRfEpUVeUKLIzJ/2CNqfWFo2rMiY8a4W3NvArGOQ==
X-Google-Smtp-Source: APiQypKKGnGHF4tnmlwtWGF4DpTbHht+3aEAOscU3G23j5zTPCpmd6YJlMRvb/03pqvb+46nouXpy1xY4bl3GTgm598=
X-Received: by 2002:a02:b055:: with SMTP id q21mr1499678jah.7.1588926394147;
	Fri, 08 May 2020 01:26:34 -0700 (PDT)
MIME-Version: 1.0
From: Paul Richards <paul.richards@gmail.com>
Date: Fri, 8 May 2020 09:26:23 +0100
Message-ID: <CAMoswehmi-hhp2M0w_8nEwX5CwPKKR7YW9jw1QrNzE=PFqKcRw@mail.gmail.com>
To: dm-devel@redhat.com, linux-lvm@redhat.com
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0488Qdpn031251
X-loop: dm-devel@redhat.com
Subject: [dm-devel] lvmcache comes back dirty after unclean shutdown
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,
I would like to add a warning to the lvmcache man page about its
suitability in environments that expect unclean shutdowns.

I've been using lvmcache on my laptop which has a small nvme drive and
a much larger hdd.  I am using approx 60GiB of the nvme drive as a
cache for the 1TiB HDD.

With both "writethrough" and "writeback" modes an unclean shutdown
results in the entire cache being marked as dirty.  On next boot the
system then spends a long time (4+ hours) writing the cache out to
disk.  From what I can see this is known behavior of lvmcache ([1] and
[2]).  It's even documented in the kernel device mapper docs [3].

It seems to me that dm-cache and lvmcache are not appropriate for
environments that expect unclean shutdowns.  In those environments I
have found bcache to be a bit more robust.

This is not a criticism of lvmcache and dm-cache.  I am sure they
perform well in more robust environments.  But I wonder if it would be
appropriate to add a warning note to the lvmcache man page about this
issue?


I am using Ubuntu 20.04 currently, if that's relevant, and I saw the
same issue with 18.04.


1: https://www.redhat.com/archives/dm-devel/2019-July/msg00114.html
2: https://www.redhat.com/archives/dm-devel/2014-December/msg00143.html
3: https://github.com/torvalds/linux/blame/79dede78c0573618e3137d3d8cbf78c84e25fabd/Documentation/admin-guide/device-mapper/cache.rst#L140-L143


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

