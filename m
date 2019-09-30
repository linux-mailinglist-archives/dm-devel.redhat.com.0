Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A78AAC2EAF
	for <lists+dm-devel@lfdr.de>; Tue,  1 Oct 2019 10:15:01 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BB7B618C4278;
	Tue,  1 Oct 2019 08:14:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 155685D6D0;
	Tue,  1 Oct 2019 08:14:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0224D180085A;
	Tue,  1 Oct 2019 08:14:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8UJaamo003953 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 30 Sep 2019 15:36:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3CD2D5D717; Mon, 30 Sep 2019 19:36:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3762C5D713
	for <dm-devel@redhat.com>; Mon, 30 Sep 2019 19:36:33 +0000 (UTC)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EE286300C22E
	for <dm-devel@redhat.com>; Mon, 30 Sep 2019 19:36:32 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id q10so6183994pfl.0
	for <dm-devel@redhat.com>; Mon, 30 Sep 2019 12:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:subject:to:cc:references:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=H97JuRzTawzjptZSMNylKho6vMxm73iMh4ASCWPnXgg=;
	b=sDrqqtHCvLRw5rjgT4ECfrcTAIgkWkGA8e5ODBlso7j+D4qSIlUyYRBoH5wRYQ/REp
	fnHFK+nemA9Rir50ieKU0/40UcLC25oakL093aGMC4EkUUCunodt/zHU34AXEB+BTTW/
	+CMRiI/38rw4rxxzAqumdjee2h90Gw0bvkpCte451dK+lGdB9c9mGk8O7Th8dPSf0miH
	r/ORozUT+agvVozZXjVfocor49ZLd2TapfSjbWT3hMRPi34NmVbxVp1vECMVcf2uO8xA
	qgn0jOxtqF+bPQmzBggpTfK+cChuqjCL+5yEFz2yLVltWTsIlftnd62zrcbjbHfpTD/S
	vVIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:cc:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=H97JuRzTawzjptZSMNylKho6vMxm73iMh4ASCWPnXgg=;
	b=DDrPC6SvPJeEDPMyWcojmdY7Pa8+AWFqsJ4VRumlMbG8SLYra76hkr4o2fvWpJQl4G
	m9FqMqwAroajq4GGp56l0mITO6aNTArVs0cJ2+M/gL81z41hprReA6u5KnJs6n3g8yNR
	f0VqqdZuuohW9I/nao642lLTm1+mHnp6CA7BoJJJUseos+Yr+PvxdZatgV39esaSnukn
	7Tw/lMWZYqiXKVUWJPYSz5yusUKSBMNuGGwZXB6KlokyEt8bggW5073cfw4b/zQSZkOj
	vnpXjp4zn4U3Io5X16YqDrjs1G+k610g468cx9ciyy7nFaMsPpKJXxE11jHmab6DnxHU
	Tyhg==
X-Gm-Message-State: APjAAAViOZW24u8wnp/4WGWnvZ5STvTVJbtbxjs7N88plkV4hz+mlPUT
	b/pGNYcmieL1YcDbXD1B+Dg=
X-Google-Smtp-Source: APXvYqy7/nPFlApe6mStEXZgM/YAlHqZ4LO8JdkvjapX1nhFQGFEmthsSKSz8H1Hx4JytcVHlRi0Rg==
X-Received: by 2002:a17:90a:360b:: with SMTP id
	s11mr1038166pjb.30.1569872192133; 
	Mon, 30 Sep 2019 12:36:32 -0700 (PDT)
Received: from [172.19.249.239] ([38.98.37.138])
	by smtp.gmail.com with ESMTPSA id m12sm341402pjl.22.2019.09.30.12.36.21
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 30 Sep 2019 12:36:31 -0700 (PDT)
From: Jes Sorensen <jes.sorensen@gmail.com>
X-Google-Original-From: Jes Sorensen <Jes.Sorensen@gmail.com>
To: "Guilherme G. Piccoli" <gpiccoli@canonical.com>, linux-raid@vger.kernel.org
References: <20190903194901.13524-1-gpiccoli@canonical.com>
	<20190903194901.13524-2-gpiccoli@canonical.com>
Message-ID: <608284db-7b82-6545-74bf-7a9f1d578c2f@gmail.com>
Date: Mon, 30 Sep 2019 15:36:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190903194901.13524-2-gpiccoli@canonical.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Mon, 30 Sep 2019 19:36:33 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]);
	Mon, 30 Sep 2019 19:36:33 +0000 (UTC) for IP:'209.85.210.193'
	DOMAIN:'mail-pf1-f193.google.com'
	HELO:'mail-pf1-f193.google.com' FROM:'jes.sorensen@gmail.com'
	RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.210.193 mail-pf1-f193.google.com 209.85.210.193
	mail-pf1-f193.google.com <jes.sorensen@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.47
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 01 Oct 2019 04:14:27 -0400
Cc: nfbrown@suse.com, Song Liu <songliubraving@fb.com>, liu.song.a23@gmail.com,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	jay.vosburgh@canonical.com
Subject: Re: [dm-devel] [PATCH v4 2/2] mdadm: Introduce new array state
 'broken' for raid0/linear
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.62]); Tue, 01 Oct 2019 08:15:00 +0000 (UTC)

On 9/3/19 3:49 PM, Guilherme G. Piccoli wrote:
> Currently if a md raid0/linear array gets one or more members removed while
> being mounted, kernel keeps showing state 'clean' in the 'array_state'
> sysfs attribute. Despite udev signaling the member device is gone, 'mdadm'
> cannot issue the STOP_ARRAY ioctl successfully, given the array is mounted.
> 
> Nothing else hints that something is wrong (except that the removed devices
> don't show properly in the output of mdadm 'detail' command). There is no
> other property to be checked, and if user is not performing reads/writes
> to the array, even kernel log is quiet and doesn't give a clue about the
> missing member.
> 
> This patch is the mdadm counterpart of kernel new array state 'broken'.
> The 'broken' state mimics the state 'clean' in every aspect, being useful
> only to distinguish if an array has some member missing. All necessary
> paths in mdadm were changed to deal with 'broken' state, and in case the
> tool runs in a kernel that is not updated, it'll work normally, i.e., it
> doesn't require the 'broken' state in order to work.
> Also, this patch changes the way the array state is showed in the 'detail'
> command (for raid0/linear only) - now it takes the 'array_state' sysfs
> attribute into account instead of only rely in the MD_SB_CLEAN flag.
> 
> Cc: Jes Sorensen <jes.sorensen@gmail.com>
> Cc: NeilBrown <neilb@suse.de>
> Cc: Song Liu <songliubraving@fb.com>
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@canonical.com>
> ---

Applied thanks!

I fixed up one minor nit rather than having to do the merry-go-round by 
email one more time:

> diff --git a/Monitor.c b/Monitor.c
> index 036103f..cf0610b 100644
> --- a/Monitor.c
> +++ b/Monitor.c
[snip]

> @@ -1116,7 +1119,8 @@ int WaitClean(char *dev, int verbose)
>   			rv = read(state_fd, buf, sizeof(buf));
>   			if (rv < 0)
>   				break;
> -			if (sysfs_match_word(buf, clean_states) <= 4)
> +			if (sysfs_match_word(buf, clean_states)
> +			    < (int)ARRAY_SIZE(clean_states)-1)

I moved the < up to the correct line where it belongs, and added spaces 
") - 1)"

Cheers,
Jes

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
