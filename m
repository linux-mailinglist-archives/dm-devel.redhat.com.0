Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3A1D22451CC
	for <lists+dm-devel@lfdr.de>; Sat, 15 Aug 2020 22:38:00 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-B1A0lKqCPqiJtfd1MWMO5Q-1; Sat, 15 Aug 2020 16:37:57 -0400
X-MC-Unique: B1A0lKqCPqiJtfd1MWMO5Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 256371DDE2;
	Sat, 15 Aug 2020 20:37:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9048E5B680;
	Sat, 15 Aug 2020 20:37:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A81CD18408A1;
	Sat, 15 Aug 2020 20:37:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07FKb0Ex024786 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 15 Aug 2020 16:37:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6F3552B4D07; Sat, 15 Aug 2020 20:37:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A6A97D2B8
	for <dm-devel@redhat.com>; Sat, 15 Aug 2020 20:36:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 040DA800CAF
	for <dm-devel@redhat.com>; Sat, 15 Aug 2020 20:36:58 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-549-mgi3wKVXNQCoMt_B264NtA-1; Sat, 15 Aug 2020 16:36:55 -0400
X-MC-Unique: mgi3wKVXNQCoMt_B264NtA-1
Received: by mail-wm1-f44.google.com with SMTP id t14so10718795wmi.3
	for <dm-devel@redhat.com>; Sat, 15 Aug 2020 13:36:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:cc:references:message-id:date
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=3aDnTj18SmuNPdv0T/71OdUxWpKaB5PC9vEaqoHUW9c=;
	b=Ya0NOxBGi55DtBRKp+pBb2Me1krYwMPzAk41YDypxHJaemb11oiGdZCpztryHErpUs
	/4fSaJTPGypq6iSaooW/bwuXWmIoUml7Wv/gZtkb2CEUKL4UTGJLGwHIOxTPOSAI0qJe
	qru/6z2T1AarOzD5H5ZufP8TS2aIcq2pvUY41foROy5TxONNT0Rzrgzc43UDq4C4fyV7
	wYDC6OuE42gpB5SLwnPT4UE42XvybAp8rmfVD6pEEBdtSiwAuKoTy71I+JDTukDJrBvJ
	ZKPx66pfSfbQ45OY+9Z2IGPmxXc2OjAB5lRS9yiGXo7DtrfNF6uMX1oHiqvLKNu6SPr8
	ToTg==
X-Gm-Message-State: AOAM531OU+6jDE7NO8RcOzvW4H0pVqXX8HhcDQ/zNUOPhhejPk/6YbeT
	gScTCZGRA1BFj21fk2Gj3+QwVxT2tg==
X-Google-Smtp-Source: ABdhPJxmbOAf7tXWqP8uLvGI4+Y1lzUvn1ix7bgjc6gx+7JERmKx4u7lzQ21xGPeyT6qE6I/ELQfRw==
X-Received: by 2002:a1c:9a06:: with SMTP id c6mr7612278wme.23.1597523813920;
	Sat, 15 Aug 2020 13:36:53 -0700 (PDT)
Received: from localhost (201.red-83-37-180.dynamicip.rima-tde.net.
	[83.37.180.201]) by smtp.gmail.com with ESMTPSA id
	a188sm23643373wmc.31.2020.08.15.13.36.53
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sat, 15 Aug 2020 13:36:53 -0700 (PDT)
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
To: "McIntyre, Vincent (CASS, Marsfield)" <Vincent.Mcintyre@csiro.au>
References: <20200810043316.GH21810@mayhem.atnf.CSIRO.AU>
	<8c910ecb-ddf8-0a91-4310-4daedb85cd89@gmail.com>
	<20200813235143.GB2644@mayhem.atnf.CSIRO.AU>
	<f9f8c62f-fa97-dbcb-52dd-503d392df95f@gmail.com>
	<20200814021835.GD2644@mayhem.atnf.CSIRO.AU>
Message-ID: <30d53099-24dd-254a-13f2-9f1a488c1773@gmail.com>
Date: Sat, 15 Aug 2020 22:36:52 +0200
MIME-Version: 1.0
In-Reply-To: <20200814021835.GD2644@mayhem.atnf.CSIRO.AU>
Content-Language: en-US
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] Promise and ALUA
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
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

On 8/14/20 4:18 AM, McIntyre, Vincent (CASS, Marsfield) wrote:

> This is the device section I had before for the Promise
>          device {
>                  vendor "Promise"
>                  product "VTrak"
>                  product_blacklist "VTrak V-LUN"
                    path_grouping_policy "multibus" <---------
>                  path_selector "service-time 0"
>                  path_checker "tur"
                    prio "alua"                     <---------
>                  failback "immediate"
>                  no_path_retry 30

"multibus" and "prio alua" are incompatible!

>          }
> The only real differences are the prio and failback.
 From your tests and Promise docs, it looks like it's an Active-Passive array
with ALUA support.
It should use latest firmware [1]. And ALUA must be enabled to get the best
performance and stability.
Otherwise, the array will work with only one path per LUN.

The multipath-tools default settings is already optimized for the ALUA config.


[1] https://www.promise.com/Support/DownloadCenter/VTrak/Ex30/E830f#Firmware

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

