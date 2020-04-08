Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 913541A2495
	for <lists+dm-devel@lfdr.de>; Wed,  8 Apr 2020 17:06:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586358388;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bE9okKdc4QobeWAbnavjGinB9mM6PgxQ3mcN2oYNrhU=;
	b=VSrMRusXY7kdOAZOtr7TX8Ym2rxJlzr81ynTr0o8JreiOawar1tp+nOLcWFzC4hT3B434U
	7SUVCEAonLYx6JBHRrK1pHBqEC98fwpBwHI7q03ABJqYAIZJJ0NyDpTnTz+23AyrCnPkvq
	XyiA4SoKH9p4kunoZdXADlgYTud86tk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-298-Id3bRtHrNsa01a-qjPWDkA-1; Wed, 08 Apr 2020 11:06:25 -0400
X-MC-Unique: Id3bRtHrNsa01a-qjPWDkA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 220F318B9FC6;
	Wed,  8 Apr 2020 15:06:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F2B16953DD;
	Wed,  8 Apr 2020 15:06:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4FBFE93A83;
	Wed,  8 Apr 2020 15:05:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 038F5i0o016544 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 8 Apr 2020 11:05:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AF2151055472; Wed,  8 Apr 2020 15:05:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A9B3D105546E
	for <dm-devel@redhat.com>; Wed,  8 Apr 2020 15:05:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AA88E1017E42
	for <dm-devel@redhat.com>; Wed,  8 Apr 2020 15:05:39 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-201-Oh3iZZTOPf62IgySagJCEA-1; Wed, 08 Apr 2020 11:05:35 -0400
X-MC-Unique: Oh3iZZTOPf62IgySagJCEA-1
Received: by mail-wm1-f66.google.com with SMTP id z6so244627wml.2
	for <dm-devel@redhat.com>; Wed, 08 Apr 2020 08:05:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=w2PB8gaF1/sQxM90Xuiw7xxyRcW8pruK0wieGuJplAo=;
	b=WRufnJfVmySYlQM0xHa+w16a0IUncUtDN9CYsu0zxythX/vsXTyHFXZqUBz8O7/KV6
	GktZASKqjMlX9LYhxDa9DofSGeHsWDC0Zr8+xBUPf7QlSVDzy2QpcNC8Ngv45BDGqZcJ
	LASVMlW5260grwDviHoNaWBIkf/0A4Jd1TalX+SM3Q7oJKRCCKWnlpvDerLs6Vt2mduO
	4Zc8TT9iNYXgDrsZiDholAQK2+01Q+BiphFQXpNbgwdaU2i0BWzITBecNCEORmOSdrhO
	CocoHZydJaGRU0XB+iOklByHCnJpGBVeVq1CZLRZBKsS0CV/mFaR1z2Ltc0Zm7lEJXU7
	//GQ==
X-Gm-Message-State: AGi0PuY4o/dyWrPOCfYUBZYOGSSwa09gO1s42rYfHNCcqRsjEzK4FuZr
	sJm9lDNS8ioW96+v9k6ROo3a73/c
X-Google-Smtp-Source: APiQypJSgcPAOr/lHs2BW8Vr5hGXgkp57YDOK09BwtZ31lLUjc2G+tb5teLqzuroQmwH+FjCFuwERw==
X-Received: by 2002:a1c:5605:: with SMTP id k5mr5407824wmb.83.1586358334287;
	Wed, 08 Apr 2020 08:05:34 -0700 (PDT)
Received: from [192.168.2.27] (39.35.broadband4.iol.cz. [85.71.35.39])
	by smtp.gmail.com with ESMTPSA id
	h26sm6955966wmb.19.2020.04.08.08.05.32
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 08 Apr 2020 08:05:33 -0700 (PDT)
To: Andreas Kinzler <hfp@posteo.de>, dm-devel@redhat.com
References: <754a4098-9da2-3395-8a9e-f5b7737ed242@posteo.de>
From: Milan Broz <gmazyland@gmail.com>
Message-ID: <66dbdf7d-8c47-d723-0c15-cb7176934d42@gmail.com>
Date: Wed, 8 Apr 2020 17:05:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <754a4098-9da2-3395-8a9e-f5b7737ed242@posteo.de>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] alignment enforcement in dm-crypt causes severe
	problems
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

On 08/04/2020 12:21, Andreas Kinzler wrote:
> Hello devs,
> 
> please see issue: 
> https://github.com/virtio-win/kvm-guest-drivers-windows/issues/446
> 
> Short summary: When using encrypted disks with qemu (using dm-crypt) and 
> pass that through LIO/vhost to qemu (via virtio-scsi) the following code 
> is hit:
> 
> https://elixir.bootlin.com/linux/v5.3.18/source/drivers/md/dm-crypt.c#L1251
> 
> I am not familiar with the specification/contract of "bio". So I am not 
> sure if the enforced alignment is legitimate.

Encryption in dm-crypt works with sectors as atomic units of encryption,
so data legth in bio must be aligned to whole sectors.

For example, if you use CBC (Cipher Block Chaining mode), and only
partial encrypted sector is written, the rest is corrupted.

So this restriction is perfectly valid there.

The question is what operation sends such bio structures.
If it is some control operation, it should probably bypass it.

Anyway this seems like but in the driver that sends such bio.

Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

