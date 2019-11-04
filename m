Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 18272EFC0C
	for <lists+dm-devel@lfdr.de>; Tue,  5 Nov 2019 12:09:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572952165;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=W/sHeU3QgRlRN2GbC5W8uz92GaLdTKdfRicz2KelbBs=;
	b=c0Y8U+8UKXtOh+u31rZfIky/NRmdtD91PGzM69dqsOV4rVR9gl1ZWRJVM+BXoqo0aFzGoL
	tL2Wew9tRWnfTXb470LcqQsX14kDNX/nGwDOtJlNE2xCm0IliUsO73nq0sLgUTTWXuQ9Us
	isnHkr6GH/lM1IfGJgj/bmzT1r83maM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-zRWRGiwQN5CQLCqg3nNSUw-1; Tue, 05 Nov 2019 06:09:23 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE2F21800D4A;
	Tue,  5 Nov 2019 11:09:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CE9D1001B00;
	Tue,  5 Nov 2019 11:09:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DE4684BB5B;
	Tue,  5 Nov 2019 11:09:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA4FhSAM023530 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 4 Nov 2019 10:43:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B202F5DA7D; Mon,  4 Nov 2019 15:43:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ACB115D9E5
	for <dm-devel@redhat.com>; Mon,  4 Nov 2019 15:43:25 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A0BE32A09AD
	for <dm-devel@redhat.com>; Mon,  4 Nov 2019 15:43:24 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id t26so12486864wmi.4
	for <dm-devel@redhat.com>; Mon, 04 Nov 2019 07:43:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=x3aoGSbs0sZ0e4CNvJ0++eKOwflm1R6Dvepc2dx+kWI=;
	b=sOGm1brlJGMXuTVsqgYX/NeSTYSg/WJfOsVEDH5VViy/WpURGgLikK0I8EXQXAHcB6
	6bjFLEUceT2pJ4GDsTX9c9NyRGGxcg75N3qlt8hE/GFNzJ+On8qASTVh/0ZqPYzysp//
	nm1XrLkDveoaSXkkFEpNd0LhkThC+H8IUm9QOxjBzTXKuoNqENzRIL/ExsFE6nQpKyns
	UUwANOHmerJiIbqkuTwVqF1JD7d7s1XGJQgBQkdAo20gaklRDDL8PJCAbrB63JM1lcTN
	FeZ5C+wD867veaBqmthOdkl43nsTOF42L/ZMpuaFnyCjUVELJdTiJE+n9CfwlWobFux0
	QPeg==
X-Gm-Message-State: APjAAAVWLHoYjb9Yd8GvblHyqFXYRMnTMFlSi0SyW9kQz4UmOmsRR++8
	xx7JYoRm0flR8sleIK3G7xeg5RuRGLrMYZ7DTwGNEYnw
X-Google-Smtp-Source: APXvYqz07XfLNYTLHxBO1G/nLZxGGxy2LEBls2n2Z+KuKC22wS7OLEM75HSqhJs7tOXeNEHefaeHYxqMlo3gTYAeGUA=
X-Received: by 2002:a1c:b1d4:: with SMTP id a203mr2323875wmf.160.1572882202898;
	Mon, 04 Nov 2019 07:43:22 -0800 (PST)
MIME-Version: 1.0
From: David Michael <fedora.dm0@gmail.com>
Date: Mon, 4 Nov 2019 10:43:11 -0500
Message-ID: <CAEvUa7nAYkrdsPhmQpV_ChP5Jtnn9oR2Xb=KmBbXJyTZpGUAzg@mail.gmail.com>
To: dm-devel@redhat.com
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 04 Nov 2019 15:43:24 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]);
	Mon, 04 Nov 2019 15:43:24 +0000 (UTC) for IP:'209.85.128.54'
	DOMAIN:'mail-wm1-f54.google.com' HELO:'mail-wm1-f54.google.com'
	FROM:'fedora.dm0@gmail.com' RCPT:''
X-RedHat-Spam-Score: 0.15  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.128.54 mail-wm1-f54.google.com 209.85.128.54
	mail-wm1-f54.google.com <fedora.dm0@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.38
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 05 Nov 2019 06:06:41 -0500
Subject: [dm-devel] Making udev aware of dm-init devices
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
X-MC-Unique: zRWRGiwQN5CQLCqg3nNSUw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Hi,

I would like to be able to use a root device configured by
dm-mod.create with an initrd in some scenarios, but it appears that
the default udev rules do not recognize this setup which prevents
systemd from mounting the root file system.  There is a systemd bug
report with a demo script to illustrate what I mean.[1]  Has anyone
here encountered this, or is there a solution already?

Thanks.

David

[1] https://github.com/systemd/systemd/issues/13618#issuecomment-539566330

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

