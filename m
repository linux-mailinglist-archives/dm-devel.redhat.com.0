Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 1A6D415D9B8
	for <lists+dm-devel@lfdr.de>; Fri, 14 Feb 2020 15:48:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581691706;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6D/6KSt4YO9YJzjvk/gMD/SsE/jRFKqe8LOdnmKU6is=;
	b=iLGB/6k5PlxtJT3dZcIZRQ5mAyqCL0r0vm4bZ2PucMMgWaMWDpRy8lvUF4D7JhJEXVIoCk
	TDEiED225cCVtLUQ+soo3xsKRPrZNg1awBqIGpkwTO9ySR/a46nqiKJPIaqKZQMNBCvbkk
	I0oL8StKvGc1/w2Nn/wIIKKdRLN/d5s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45--uLnaz3BO9KRYyrlh0elgg-1; Fri, 14 Feb 2020 09:48:23 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2AD8802704;
	Fri, 14 Feb 2020 14:48:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 57DFF845A0;
	Fri, 14 Feb 2020 14:48:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4FC6E18089CD;
	Fri, 14 Feb 2020 14:48:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01EElptg022962 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 14 Feb 2020 09:47:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 992112166B2D; Fri, 14 Feb 2020 14:47:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 94B932166B2A
	for <dm-devel@redhat.com>; Fri, 14 Feb 2020 14:47:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A49611011E21
	for <dm-devel@redhat.com>; Fri, 14 Feb 2020 14:47:49 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
	[209.85.208.171]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-115-x4KPUZ_9MmOxx4yP-VN8vg-1; Fri, 14 Feb 2020 09:47:46 -0500
Received: by mail-lj1-f171.google.com with SMTP id d10so11030925ljl.9
	for <dm-devel@redhat.com>; Fri, 14 Feb 2020 06:47:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=Ok/zchz5HybY2YaZQOK5G8jni2mQ3C4zse+5DjQPyMM=;
	b=IENjKGFEYK4vNsLvaX8mCPWeNJ+k02bbF0yrVpWPlxV/M0BG7xr+RUxQsIpKk9q2NE
	ClBWunkyAO1HpkDLZyrQrnBSthl6VaKxYk4ZNCHU1A4F5ZYn2ojDWCxsoeH2DrgUVhHp
	6X/+/K6fkpyJ0PXZYwPf1Zb+z/4mRdOO6B4fRG0vKLD6oEmvPlSmDHETP40xbmVY1Sop
	6MBVYw7QUrYIwMBfzt2sfX9O2tpkH5MunJmQoJz6ns/2M65U0WcMA17nVdqe4vZSfrXW
	xly0luKjEnAqgyRLWVrElmZ1UNgMA1Qe1XpvTcOsqCXFPcjSegkQcO2isPP8SpxXmqAI
	zaFA==
X-Gm-Message-State: APjAAAXGqHDFRH8g8OLy8P9k4E294lPg7sAoQWLoaw5rXOi8GiJQKX2h
	UIX41w4Cpw7CdXLaU2PHmCtG8PzvUZ6LvwBrii8MY7Ui
X-Google-Smtp-Source: APXvYqx4vzklP/bHXO3/Y6kA3W6lQIg/b+j1FrIcyWAKG1hI3qkc3iHiCoD5dX+CsI3nY6I3zP20LCoG8cN5Rn8NPAI=
X-Received: by 2002:a2e:85cd:: with SMTP id h13mr2449158ljj.191.1581691664544; 
	Fri, 14 Feb 2020 06:47:44 -0800 (PST)
MIME-Version: 1.0
From: Roger Heflin <rogerheflin@gmail.com>
Date: Fri, 14 Feb 2020 08:47:33 -0600
Message-ID: <CAAMCDefQhNmMN+bys+ASU8sw4zu-FkbC7o=emzYhpzOKy7N0jg@mail.gmail.com>
To: dm-devel@redhat.com
X-MC-Unique: x4KPUZ_9MmOxx4yP-VN8vg-1
X-MC-Unique: -uLnaz3BO9KRYyrlh0elgg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01EElptg022962
X-loop: dm-devel@redhat.com
Subject: [dm-devel] question about multipathd patch thought.
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Because of some tools we use to "move" luns from one array to another,
we have ended up with duplicate lunids (human errors around the
designed process) on 2 separate arrays presented to the exact same
hosts.  This has caused multipath to assemble all 4 paths into the
same device, 2 of which don't have the same data.  The environment I
work in has 1000's of physical hosts, and 100's arrays.

If I were to create and submit a patch to validate (if say we set
verify_new_path_matches to yes in the config file, default is no) that
the new paths size, vendor, and model match, if they don't match then
print to syslog, and don't add it to the path. It is understood that
when we use this option when we are using the tool that causes the
above problem we would need to disable that option, and once that
process is finished then re-enable the option.   If such a patch was
created would the patch be accepted to the multipath upstream?

Roger Heflin


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

