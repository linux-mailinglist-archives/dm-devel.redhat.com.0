Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 9B1C72685BE
	for <lists+dm-devel@lfdr.de>; Mon, 14 Sep 2020 09:24:27 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-WjEL2qghOWimnC8wm1DrkA-1; Mon, 14 Sep 2020 03:24:24 -0400
X-MC-Unique: WjEL2qghOWimnC8wm1DrkA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A5751074667;
	Mon, 14 Sep 2020 07:24:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6271C75138;
	Mon, 14 Sep 2020 07:24:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9D34B1832FDB;
	Mon, 14 Sep 2020 07:24:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08AAGgFW020197 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 10 Sep 2020 06:16:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DC4052166B27; Thu, 10 Sep 2020 10:16:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D79FC21CB2A0
	for <dm-devel@redhat.com>; Thu, 10 Sep 2020 10:16:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B212101A53F
	for <dm-devel@redhat.com>; Thu, 10 Sep 2020 10:16:40 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-100-2IfFh9caNNuFLmpryHwCaw-1; Thu, 10 Sep 2020 06:16:38 -0400
X-MC-Unique: 2IfFh9caNNuFLmpryHwCaw-1
Received: by mail-wm1-f68.google.com with SMTP id y15so5243460wmi.0
	for <dm-devel@redhat.com>; Thu, 10 Sep 2020 03:16:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=DqY3ytm1lW24L4dBr5ZhfVe1Kl4JG7b6aElJixa0DtQ=;
	b=IYSvlyoVAUhIbO1a/vdU3w4qk6m5PAFWfrGqSaIUCWU8DBO7dwokSrm3qtyu0JEyoR
	YEIlDLdQOtfMCQBYmh5fNFUHq+sn37O2Q1F6Hl0vr4Wigh+PadSTVvGdntwH8ozubFLR
	2A/kMC9Ct50ieHHY24uqcVZ11Cxg8Pd556GfPd48FYGVRnlHNXHoe+lEwXru5Sim6EHe
	y8YzQaHMKQJMnbK7Dse/t1mkuBwuK55jkBcW+Wa58Kkm94wRV+yLThBQWJorAB6uQ6aD
	9o8+LlgM1/w2qaNPuNu0s6SF76JYZPl9pqqrt4NTvW0O6KL23kBwroQxcd8Brn9pSczs
	EruA==
X-Gm-Message-State: AOAM533LUfuf+VyI2mmXYwvqTk+ThC0OtKnZJB/py2ZxDZg/IGeFEnDe
	8ji1ZlCTMuku6cUZpnnPGxQ=
X-Google-Smtp-Source: ABdhPJxz+CTfYBRsr9wPZ8ehDJQEmTq++yYJr4Xo0s0U0R6hQKoUpOmBLcC8LM7TIOPThVoU3WYKbg==
X-Received: by 2002:a1c:234b:: with SMTP id j72mr7837172wmj.153.1599732997083; 
	Thu, 10 Sep 2020 03:16:37 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.201])
	by smtp.gmail.com with ESMTPSA id
	a127sm2936155wmh.34.2020.09.10.03.16.34
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 10 Sep 2020 03:16:36 -0700 (PDT)
To: Joe Perches <joe@perches.com>, LKML <linux-kernel@vger.kernel.org>,
	Jiri Kosina <trivial@kernel.org>
References: <e6387578c75736d61b2fe70d9783d91329a97eb4.camel@perches.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <81d852d4-115f-c6c6-ef80-17c47ec4849a@gmail.com>
Date: Thu, 10 Sep 2020 12:16:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <e6387578c75736d61b2fe70d9783d91329a97eb4.camel@perches.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 14 Sep 2020 03:23:33 -0400
Cc: linux-fbdev@vger.kernel.org, oss-drivers@netronome.com,
	nouveau@lists.freedesktop.org, alsa-devel <alsa-devel@alsa-project.org>,
	dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
	linux-ide@vger.kernel.org, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-afs@lists.infradead.org,
	linux-rtc@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, dccp@vger.kernel.org,
	linux-rdma@vger.kernel.org, linux-atm-general@lists.sourceforge.net,
	kvmarm@lists.cs.columbia.edu, coreteam@netfilter.org,
	intel-wired-lan@lists.osuosl.org, linux-serial@vger.kernel.org,
	linux-input@vger.kernel.org, linux-mmc@vger.kernel.org,
	Kees Cook <kees.cook@canonical.com>, linux-media@vger.kernel.org,
	linux-pm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-nvme@lists.infradead.org, storagedev@microchip.com,
	ceph-devel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-nfs@vger.kernel.org, linux-parisc@vger.kernel.org,
	netdev@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-wireless@vger.kernel.org, linux-sctp@vger.kernel.org,
	iommu@lists.linux-foundation.org,
	netfilter-devel@vger.kernel.org, linux-crypto@vger.kernel.org,
	bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [dm-devel] [trivial PATCH] treewide: Convert switch/case
 fallthrough; to break;
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 09/09/2020 22:06, Joe Perches wrote:
> diff --git a/drivers/net/wireless/mediatek/mt7601u/dma.c b/drivers/net/wireless/mediatek/mt7601u/dma.c
> index 09f931d4598c..778be26d329f 100644
> --- a/drivers/net/wireless/mediatek/mt7601u/dma.c
> +++ b/drivers/net/wireless/mediatek/mt7601u/dma.c
> @@ -193,11 +193,11 @@ static void mt7601u_complete_rx(struct urb *urb)
>   	case -ESHUTDOWN:
>   	case -ENOENT:
>   		return;
> +	case 0:
> +		break;
>   	default:
>   		dev_err_ratelimited(dev->dev, "rx urb failed: %d\n",
>   				    urb->status);
> -		fallthrough;
> -	case 0:
>   		break;
>   	}
>   
> @@ -238,11 +238,11 @@ static void mt7601u_complete_tx(struct urb *urb)
>   	case -ESHUTDOWN:
>   	case -ENOENT:
>   		return;
> +	case 0:
> +		break;
>   	default:
>   		dev_err_ratelimited(dev->dev, "tx urb failed: %d\n",
>   				    urb->status);
> -		fallthrough;
> -	case 0:
>   		break;
>   	}

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

