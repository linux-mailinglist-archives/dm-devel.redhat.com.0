Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C1D95A0A
	for <lists+dm-devel@lfdr.de>; Tue, 20 Aug 2019 10:44:10 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E9E781FAA63;
	Tue, 20 Aug 2019 08:44:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 547C29F7C;
	Tue, 20 Aug 2019 08:44:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C083C24F31;
	Tue, 20 Aug 2019 08:43:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7JIBBRT021172 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 19 Aug 2019 14:11:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AB5121E9; Mon, 19 Aug 2019 18:11:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A61585C2E2
	for <dm-devel@redhat.com>; Mon, 19 Aug 2019 18:11:09 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 694B7309B68B
	for <dm-devel@redhat.com>; Mon, 19 Aug 2019 18:11:08 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id s14so2217357qkm.4
	for <dm-devel@redhat.com>; Mon, 19 Aug 2019 11:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QUo3vv/nySNtkH4c0ejok0wACVdS9AW/rtC9nJIa5ZM=;
	b=VJfj0iMxpeahYQMEN/7zlKXbBZDjF9zBVgVDxANzrksehdvUz7XgEtKf9Ea/tNl5Sr
	gZ2/6W19/E9GgzvlLV/hKct0W/NtqA2UnI3qbpeRPs902j64StagLGCGmn13bSQPLvV9
	dcPC4rpo/Y4jaUqW2LWcFO/lrd4YgLgt9d9Cjy8O4bvQzrrTFvFRdo00APQSPQDMOYdj
	06KVMu8jncjqAP8Uy3b/a2C9qcwizlFjyKqIBBmSOm/2FXn7zRdZRclOb1jiVTOLmCVn
	tknQVkPKGnMBKk4QtX/m0F8Y624pnE47/OBPKemYV01IOwa5e1iF3zJUywmUVCKKm0XH
	W1PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QUo3vv/nySNtkH4c0ejok0wACVdS9AW/rtC9nJIa5ZM=;
	b=tlnsGaHA7DXyDmXpoVzCR8rIemgXtOtjopV9glvvrMmJIMkatgGgl+h6xpcR1tjRAQ
	+X/tHXVBKLDLv70S209spREpVwQLhUfkRO8CtpQlL4LdQTb4ZGfSmOGNQJTWC2k1Pmiy
	EoL4cPqaHGLxni05w9kywXCWCxRK+EP3/oUnTRecFgEw8u5+YAne6bB14Iw9Jj59sYvR
	/MH/EBpdN6D5x8anGVQkqG4sL8uz0Jf0GZ3LpyQG42OjeqozHbfjPtKpgBCUl4j1qa3G
	WcsKe3N5tPJN6GCLYY7oSz41WAlxTG5+Wh3x9QY8BGSpsg9iGoNxvn9eBtrzrnC8CRW3
	gB7Q==
X-Gm-Message-State: APjAAAVLV6S0GcVEM+epm1b7xNI0zf8VsPWmIFT86ZV8OjTPjZOxsOqB
	JILEuW+whMs5buM5RcXED26rCqTWavHSlZ9LOUc=
X-Google-Smtp-Source: APXvYqzLdH7ejeArb92iobT856dPrFHhyxu76ltyuadDWvLzMWNjn3Nho+gdzzKjbbLPdamdiOJQEobLjuXHwZdxQXs=
X-Received: by 2002:a37:a142:: with SMTP id k63mr22046145qke.487.1566238267635;
	Mon, 19 Aug 2019 11:11:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190816134059.29751-1-gpiccoli@canonical.com>
In-Reply-To: <20190816134059.29751-1-gpiccoli@canonical.com>
From: Song Liu <liu.song.a23@gmail.com>
Date: Mon, 19 Aug 2019 11:10:56 -0700
Message-ID: <CAPhsuW7aGze5p9DgNAe=KakJGXTNqRZpNCtvi8nKxzS2MPXrNQ@mail.gmail.com>
To: "Guilherme G. Piccoli" <gpiccoli@canonical.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Mon, 19 Aug 2019 18:11:08 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]);
	Mon, 19 Aug 2019 18:11:08 +0000 (UTC) for IP:'209.85.222.195'
	DOMAIN:'mail-qk1-f195.google.com'
	HELO:'mail-qk1-f195.google.com' FROM:'liu.song.a23@gmail.com'
	RCPT:''
X-RedHat-Spam-Score: 0.15  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.222.195 mail-qk1-f195.google.com 209.85.222.195
	mail-qk1-f195.google.com <liu.song.a23@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.47
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 20 Aug 2019 04:43:46 -0400
Cc: linux-block@vger.kernel.org, Song Liu <songliubraving@fb.com>,
	NeilBrown <neilb@suse.com>,
	linux-raid <linux-raid@vger.kernel.org>, dm-devel@redhat.com,
	Jay Vosburgh <jay.vosburgh@canonical.com>
Subject: Re: [dm-devel] [PATCH v2 1/2] md raid0/linear: Introduce new array
	state 'broken'
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.71]); Tue, 20 Aug 2019 08:44:09 +0000 (UTC)

On Fri, Aug 16, 2019 at 6:41 AM Guilherme G. Piccoli
<gpiccoli@canonical.com> wrote:
>
> Currently if md raid0/linear array gets one or more members removed while
> being mounted, kernel keeps showing state 'clean' in the 'array_state'
> sysfs attribute. Despite udev signaling the member device is gone, 'mdadm'
> cannot issue the STOP_ARRAY ioctl successfully, given the array is mounted.
>
> Nothing else hints that something is wrong (except that the removed devices
> don't show properly in the output of 'mdadm detail' command). There is no
> other property to be checked, and if user is not performing reads/writes
> to the array, even kernel log is quiet and doesn't give a clue about the
> missing member.
>
> This patch changes this behavior; when 'array_state' is read we introduce
> a non-expensive check (only for raid0/md-linear) that relies in the
> comparison of the total number of disks when array was assembled with
> gendisk flags of those devices to validate if all members are available
> and functional. A new array state 'broken' was added: it mimics the state
> 'clean' in every aspect, being useful only to distinguish if such array
> has some member missing. Also, we show a rate-limited warning in kernel
> log in such case.
>
> This patch has no proper functional change other than adding the
> 'clean'-like state; it was tested with ext4 and xfs filesystems. It
> requires a 'mdadm' counterpart to handle the 'broken' state.
>
> Cc: NeilBrown <neilb@suse.com>
> Cc: Song Liu <songliubraving@fb.com>
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@canonical.com>

If we merge this with the MD_BROKEN patch, would the code look simpler?

Thanks,
Song

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
