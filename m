Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2DEF81B4AD6
	for <lists+dm-devel@lfdr.de>; Wed, 22 Apr 2020 18:48:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587574100;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EN7ZzYKAfEYd3pKQ4uVse4mmESf//yMsGyWpumLDjV4=;
	b=dMbqRjk+oU+MigVwkQKF9gLm9e4WHnSYeWXbpWDrrYlaktXhKHWfHmJ6U9/8PM3arwOme8
	RsSu6MjVVmgudWUckX/QL0EGAT4zJRs7kw0c5PZkQaK8rpy5UvYZAmEEsQqE7DguE7oRfG
	9OYdHVmBE1m2KdZrEalfEEK95C3gHMw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-qhBQZTK-PyuWsvhz8t4eDQ-1; Wed, 22 Apr 2020 12:48:17 -0400
X-MC-Unique: qhBQZTK-PyuWsvhz8t4eDQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1A77A8017F6;
	Wed, 22 Apr 2020 16:48:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5374A60C87;
	Wed, 22 Apr 2020 16:48:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B4C901809541;
	Wed, 22 Apr 2020 16:48:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03MGm21w022947 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 22 Apr 2020 12:48:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A21682166B27; Wed, 22 Apr 2020 16:48:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E0202166B29
	for <dm-devel@redhat.com>; Wed, 22 Apr 2020 16:47:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D3FC6185A793
	for <dm-devel@redhat.com>; Wed, 22 Apr 2020 16:47:59 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-67-5d1aYwGWORG5dJ1NxPXRVA-1; Wed, 22 Apr 2020 12:47:55 -0400
X-MC-Unique: 5d1aYwGWORG5dJ1NxPXRVA-1
Received: by mail-wm1-f52.google.com with SMTP id 188so3177676wmc.2;
	Wed, 22 Apr 2020 09:47:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=xJ9smglIa0cVIPZobxOlacOqQGawaWkHO0qhGaXbhu8=;
	b=GvEUwDAIvAiMtJ47r2fOE6CHTkeJ2YG5BjwrA7A+2Uvtq5Nl+f+B4ahxMroMVNUD8d
	eZwL2zMP5u0aDSmg0Vbb2J+ltqzjsVXuZ0YAiL6CdV8U2V1KaxyazcgpzXk08qdC7NIq
	AaY0rB0klwslgT8CMe/h+cSabL5qFPZ0Q53wE8wIacbpiBcq9Qp9UKdeaB0+D4kGS2ij
	C7v/KkF9ly3yrBfv/iOFM/AJ3RDO7IMfNSN3mSdqJWIs6KNAHjlqm201VMiKe0YaS33i
	W2lYxn8dYCxlGFHQcoP9Yp/nU4L5EvQNtmalE0AqOU6CS4jaytdhx8V2jmMiNYKO8EOV
	vzGQ==
X-Gm-Message-State: AGi0Pua2IRZchPT+E+coWGoD5odWHRtgGl68HVMK3NIO81i044uKyQWQ
	9MBgPjNQMTrwhwNklWR20MRJddW/FNM=
X-Google-Smtp-Source: APiQypJt1K/rlJa/qka794RN2Zl+Lu7KG+sB+Ngpj4Bbn0v7IBZxBTLZ6Cl/W9tt9XLoEGty/W5srA==
X-Received: by 2002:a05:600c:2214:: with SMTP id
	z20mr12427767wml.189.1587574073480; 
	Wed, 22 Apr 2020 09:47:53 -0700 (PDT)
Received: from [192.168.2.27] (39.35.broadband4.iol.cz. [85.71.35.39])
	by smtp.gmail.com with ESMTPSA id
	l15sm8250732wmi.48.2020.04.22.09.47.52
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 22 Apr 2020 09:47:52 -0700 (PDT)
To: Mike Snitzer <snitzer@redhat.com>, Dmitry Baryshkov <dbaryshkov@gmail.com>
References: <20200420134659.1640089-1-dbaryshkov@gmail.com>
	<20200421182754.GA49104@lobo>
From: Milan Broz <gmazyland@gmail.com>
Message-ID: <e3b78a32-4307-c60c-f9c3-dd6d71b6633c@gmail.com>
Date: Wed, 22 Apr 2020 18:47:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200421182754.GA49104@lobo>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Dmitry Baryshkov <dmitry_baryshkov@mentor.com>,
	David Howells <dhowells@redhat.com>, dm-devel@redhat.com,
	Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] dm-crypt: support using encrypted keys
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 21/04/2020 20:27, Mike Snitzer wrote:
> On Mon, Apr 20 2020 at  9:46P -0400,
> Dmitry Baryshkov <dbaryshkov@gmail.com> wrote:
> 
>> From: Dmitry Baryshkov <dmitry_baryshkov@mentor.com>
>>
>> Allow one to use encrypted in addition to user and login key types for
>> device encryption.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry_baryshkov@mentor.com>
> 
> I fixed up some issues, please see the following incremental patch,
> I'll get this folded in and staged for 5.8.

And you just created hard dependence on encrypted key type...

If you disable this type (CONFIG_ENCRYPTED_KEYS option), it cannot load the module anymore:
ERROR: modpost: "key_type_encrypted" [drivers/md/dm-crypt.ko] undefined!

We had this idea before, and this implementation in dm-crypt just requires dynamic
key type loading implemented first.

David Howells (cc) promised that moths ago, but apparently nothing was yet submitted
(and the proof-of-concept patch no longer works).

Mike, I think you should revert this patch from the tree until it is solved.

Once fixed, we should also support "trusted" key type.

Also please -  do no forget to increase dm-crypt minor version here...

Thanks,
Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

