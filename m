Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id E2BCA17989B
	for <lists+dm-devel@lfdr.de>; Wed,  4 Mar 2020 20:07:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583348867;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CNTTmcmQoOCzeJ46/JLNNUiCWN0xfqeGsGpkLZM2CZA=;
	b=hYuim3jHcjPE1IJldrweCGGlAojAR0kOppMfFlm66uXKFNweDgwH/wxHYoDnFDwfh4Llxg
	HP20gSYUcNRVu+06EVscIL/E5ZbG4lzrq27SCdaX3vcOqwQ8dHMbGvvEULI8SZ72U0lt0E
	WYX1JZ7oi0YjmQcQWY5tA6YXAaRegi4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-gAyK1wl1NxWXoTgY8XD5RQ-1; Wed, 04 Mar 2020 14:07:45 -0500
X-MC-Unique: gAyK1wl1NxWXoTgY8XD5RQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 889531005510;
	Wed,  4 Mar 2020 19:07:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B9C68B777;
	Wed,  4 Mar 2020 19:07:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8E9BC84473;
	Wed,  4 Mar 2020 19:07:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 024J7L5M002653 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 4 Mar 2020 14:07:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E660510D14C7; Wed,  4 Mar 2020 19:07:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E03A41005E5C
	for <dm-devel@redhat.com>; Wed,  4 Mar 2020 19:07:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6109D800FC4
	for <dm-devel@redhat.com>; Wed,  4 Mar 2020 19:07:18 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-387-TVZI_RreNAmpkiPz-B9NKw-1; Wed, 04 Mar 2020 14:07:16 -0500
X-MC-Unique: TVZI_RreNAmpkiPz-B9NKw-1
Received: by mail-lj1-f196.google.com with SMTP id 143so3250319ljj.7
	for <dm-devel@redhat.com>; Wed, 04 Mar 2020 11:07:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BYT2b2+02PZsG7YNDjTHObfopfKwl69vuluqo48GtJw=;
	b=fQmayqz17qwzfrElZsCEr4V5Ynra/nOttMbkZPgaBtL0ZX/1JRf+VoWPuhj7rX9xV8
	zfwmQAlVct855aWBIpmgO2VI5b/KwFy9Gbl0BqCAx3Hy7kZHSBPGVR74fvnBT7lJPDZB
	z1oa90+G+u6RmU+/iGel8IpoT/plMU3aGQAO+Q/ScwAnzRQimTjAc1SOazuR5n7dsFnS
	5ZaSck6lYo2c19c/n5JrAky+X7XIhl7pcSzLVXWpakOutYaPXGBQcWD8Pp+ArZOGe8rC
	kbioRRC6h+MfL4BJf0aaXlmsrQc9ybIq1O+lf6Xk4fWlSIC3EGtLMYfCrMhck86k5WDP
	c0vg==
X-Gm-Message-State: ANhLgQ2kCuSeetbaj+c49FKQBmBOohc874quwosuLfk9eInQ437bDBD9
	v4IB3KlGs/5aKwZXONTNYA70Hgv9xSdsTA==
X-Google-Smtp-Source: ADFU+vvVX8G7v0mT+ylHzfJnEeTUwO4EHytd3BR5bRXpqETwCuoJA/CnJ4fj1LGPPGyjDbjg+FHOzg==
X-Received: by 2002:a2e:9e03:: with SMTP id e3mr2827910ljk.186.1583348832621; 
	Wed, 04 Mar 2020 11:07:12 -0800 (PST)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com.
	[209.85.167.46]) by smtp.gmail.com with ESMTPSA id
	x11sm12311888ljj.47.2020.03.04.11.07.11 for <dm-devel@redhat.com>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 04 Mar 2020 11:07:11 -0800 (PST)
Received: by mail-lf1-f46.google.com with SMTP id x22so2429055lff.5
	for <dm-devel@redhat.com>; Wed, 04 Mar 2020 11:07:11 -0800 (PST)
X-Received: by 2002:a19:6406:: with SMTP id y6mr2912296lfb.125.1583348831107; 
	Wed, 04 Mar 2020 11:07:11 -0800 (PST)
MIME-Version: 1.0
References: <20200304150257.GA19885@redhat.com>
In-Reply-To: <20200304150257.GA19885@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 4 Mar 2020 13:06:55 -0600
X-Gmail-Original-Message-ID: <CAHk-=wgP=q648JXn8Hd9q7DuNaOEpLmxQp2W3RO3vkaD2CS_9g@mail.gmail.com>
Message-ID: <CAHk-=wgP=q648JXn8Hd9q7DuNaOEpLmxQp2W3RO3vkaD2CS_9g@mail.gmail.com>
To: Mike Snitzer <snitzer@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 024J7L5M002653
X-loop: dm-devel@redhat.com
Cc: Theodore Ts'o <tytso@mit.edu>, linux-block <linux-block@vger.kernel.org>,
	dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>,
	Hou Tao <houtao1@huawei.com>,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	Alasdair G Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [git pull] device mapper fixes for 5.6-rc5
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 4, 2020 at 9:03 AM Mike Snitzer <snitzer@redhat.com> wrote:
>
> - Bump the minor version for DM core and all target versions that have
>   seen interface changes or important fixes during the 5.6 cycle.

Can we please remove these pointless version markers entirely?

They make no sense. The kernel doesn't allow backwards incompatible
changes anyway, so the whole point of using some kind of interface
versioning is entirely bogus.

The way you test if a new feature exists or not is to just use it, and
if you're running on an old kernel that doesn't support that
operation, then it should return an error.

             Linus


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

