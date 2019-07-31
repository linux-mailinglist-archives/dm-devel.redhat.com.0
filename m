Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 5734C7F61D
	for <lists+dm-devel@lfdr.de>; Fri,  2 Aug 2019 13:41:06 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C4D403086B40;
	Fri,  2 Aug 2019 11:41:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 920191001B02;
	Fri,  2 Aug 2019 11:41:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0DE1618089C8;
	Fri,  2 Aug 2019 11:41:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6VL819i005246 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 31 Jul 2019 17:08:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0F4AF1001E85; Wed, 31 Jul 2019 21:08:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5EC3510016EA;
	Wed, 31 Jul 2019 21:07:56 +0000 (UTC)
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3BE80308FC4A;
	Wed, 31 Jul 2019 21:07:55 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id y26so67975265qto.4;
	Wed, 31 Jul 2019 14:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=CVs/vyQ7FGVG4RTAjLbBzwKgO6T77q0zizvqZWReG4U=;
	b=h5N5XV/6OzpHcXrprkzwKaYmJNAD9E8RdEvB+YK0FrlqjphI8KIf7oYowR11IArgLk
	88GJaOD/tMG54niEk7uFAUi66JZCPn+OJkRq3zPNN/KYAmb0rsZ2FpMe6vk+5EoCmN4O
	1mUcGpSPVxXH68CKu+HAhTRbBso352YVX3klLp+TdTF2bV5QNFdIddc8hpz9Bh6ljy+M
	y8I2BKGTyIIxhGXzv/Lx5gt+riMvMtc2cTzhU3sqkrQwRS5ZlO8F2CLlDiP+F2FCiBpo
	PGUJBB+NTy/FuqG/6vALo6kpveZd09LjDljEeXZxaOGN293ojUIRuCxnAzlrO24slLk0
	6EPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CVs/vyQ7FGVG4RTAjLbBzwKgO6T77q0zizvqZWReG4U=;
	b=f6S/Jpi4gkGy6gywh+jfcjBmIGHy30ED7XdnPurN9Ciq+6uY/tvg8bwKA+ixIUGip2
	Z1B9/0Tte890Kjj3J+TqvYSwIiaCRkE4jw5NXgDjaTIJYiTHDN235X6cxNbuhUi9yK69
	mkCzwtUXXIWqog1JfpyJazQ4Bt08zNtKgAPFoT+zWfNm4ltJ2rrrvokbZZkIjg8vM9gx
	+yNzgf7j/qzoL3b5Qg/0WogBZtoSj0Odt0grBwsH504F64cbXqJjhDPPAivd1POVY3IA
	dPdhzUOmQ7xkKstXFqxl8QxBpbVsTfoKdu3YPk0LAUVElhiyM/HYjXgfpg4vl4uOCMDl
	sVrQ==
X-Gm-Message-State: APjAAAV7v5UPR17suHmGHUo8UWXuJj3uoUEAGI1px7yEsna2wte9uAdK
	x9ug6eoYZMeTdKzKv4C6qjXzl09YS9mKM7Qk/GEJ5w==
X-Google-Smtp-Source: APXvYqy4QvtrszYJsHl599Ic3SuR88R8Eufu4CdNo+IYoKhGrYyNtuaYcaEFwl3crNQGDCHIWfL5uXK87UIOeU0HklE=
X-Received: by 2002:ac8:25e7:: with SMTP id f36mr87328163qtf.139.1564607274505;
	Wed, 31 Jul 2019 14:07:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190702132918.114818-1-houtao1@huawei.com>
	<CAPhsuW6yH7np1=+e5Rgutp3m1VA0TPvtANeX=0ZdpJaRKEvBkQ@mail.gmail.com>
	<b047c187-e4a6-a82a-3177-3da7fef2f6b8@huawei.com>
In-Reply-To: <b047c187-e4a6-a82a-3177-3da7fef2f6b8@huawei.com>
From: Song Liu <liu.song.a23@gmail.com>
Date: Wed, 31 Jul 2019 14:07:43 -0700
Message-ID: <CAPhsuW5c96vQDiwbPhDvKOG8_XkPapW62bkthPAHFOum2N2VhQ@mail.gmail.com>
To: Hou Tao <houtao1@huawei.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Wed, 31 Jul 2019 21:07:55 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Wed, 31 Jul 2019 21:07:55 +0000 (UTC) for IP:'209.85.160.194'
	DOMAIN:'mail-qt1-f194.google.com'
	HELO:'mail-qt1-f194.google.com' FROM:'liu.song.a23@gmail.com'
	RCPT:''
X-RedHat-Spam-Score: 0.153  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_PASS) 209.85.160.194 mail-qt1-f194.google.com 209.85.160.194
	mail-qt1-f194.google.com <liu.song.a23@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 02 Aug 2019 07:39:28 -0400
Cc: linux-block@vger.kernel.org, Song Liu <songliubraving@fb.com>,
	Mike Snitzer <snitzer@redhat.com>, NeilBrown <neilb@suse.com>,
	open list <linux-kernel@vger.kernel.org>,
	linux-raid <linux-raid@vger.kernel.org>, dm-devel@redhat.com,
	agk@redhat.com
Subject: Re: [dm-devel] [RFC PATCH 0/3] md: export internal stats through
	debugfs
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Fri, 02 Aug 2019 11:41:05 +0000 (UTC)

On Fri, Jul 26, 2019 at 10:48 PM Hou Tao <houtao1@huawei.com> wrote:
>
> Hi,
>
[...]
> >
> > Hi,
> >
> > Sorry for the late reply.
> >
> > I think these information are really debug information that we should not
> > show in /sys. Once we expose them in /sys, we need to support them
> > because some use space may start searching data from them.
> So debugfs is used to place these debug information instead of sysfs.

I don't think we should dump random information into debugfs. It is common
for the developers to carry some local patches that dumps information for
debug. We cannot get these patches upstream.

Thanks,
Song

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
