Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 055161B5E0E
	for <lists+dm-devel@lfdr.de>; Thu, 23 Apr 2020 16:42:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587652920;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=thudT1gR2Sq5DjNAiJ0e0AvYeEfwoUVHpIVhlv58I2E=;
	b=TDyW8WH9QlV/DIk5IRHkgxAbNmcwjeLNRVYc/7q3rAXregXPT6ILXBHUhMG4CwuKUkCAJN
	I06MICmRH1eX3/ay40zcB+NoS46DcEK56E73c3HBViD5GTlPC2EBJznZNDWgxPHTf54Ci4
	0fbdMSnbXtT/PW0ryDb5w0RMjLwy+ck=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-YLD9SSbnPrC-iR92DMCAZw-1; Thu, 23 Apr 2020 10:41:56 -0400
X-MC-Unique: YLD9SSbnPrC-iR92DMCAZw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 596E0462;
	Thu, 23 Apr 2020 14:41:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D93485C1D0;
	Thu, 23 Apr 2020 14:41:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1EC9F4CAA0;
	Thu, 23 Apr 2020 14:41:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03NEfUns007492 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 23 Apr 2020 10:41:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6E2F71018E6A; Thu, 23 Apr 2020 14:41:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A47E10CD887
	for <dm-devel@redhat.com>; Thu, 23 Apr 2020 14:41:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 18857811E7A
	for <dm-devel@redhat.com>; Thu, 23 Apr 2020 14:41:28 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-113-o4zwDI7KMX-Hd5Zx-HcBVg-1; Thu, 23 Apr 2020 10:41:23 -0400
X-MC-Unique: o4zwDI7KMX-Hd5Zx-HcBVg-1
Received: by mail-wm1-f66.google.com with SMTP id y24so6825027wma.4;
	Thu, 23 Apr 2020 07:41:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=NdvTJj5dPFX/8f6eMBH1S617B30doo5D8/4ddkT4ax8=;
	b=finmmaVa4/rNlfQvvwsWErJmyO4FsaCdbyx2ltxPY81PrTOujbnL7EJezy/MPJxVKy
	as9AD30BQSFSNxl7CTTW6eGN47hreXLNsn5ZlaS3im3ft5dgPmbA0QP65wFnl7i1ZszM
	0Po75aOShw0+uocfgYdSovyN+AtOl0TTnUowxITV7y+fW5ISkIUZy0YJG0r9PB6GlNpD
	LiGlctdaSOxdS4TU11h1+O7GuvOEf+C/eY9DhFicpyLr+IujgaPHGYxdbh1USoZK+Dwq
	E9dZSCQCBugOrdv33DWgkoi/r7C+fMjEHKl9YLz5So02Qb17F+4qEFvGLrSLBlRJLCp4
	pEzA==
X-Gm-Message-State: AGi0PuZxRshKaYLuiQfHMFCuBCPuCT07X4S6Ezeyjh+cZBa2dbo+atlP
	sglOe5qLGMaiUT1vFw1KWGu4nURN
X-Google-Smtp-Source: APiQypIBsGx6dt3r8Nc7eXcO1kKLl95d+aApDvMwAzwx1QOo6fa7dfRd4vvr+oRodHmeEc2fj1rmtg==
X-Received: by 2002:a05:600c:c8:: with SMTP id
	u8mr4668804wmm.142.1587652881961; 
	Thu, 23 Apr 2020 07:41:21 -0700 (PDT)
Received: from [192.168.2.27] (39.35.broadband4.iol.cz. [85.71.35.39])
	by smtp.gmail.com with ESMTPSA id e21sm4340078wrc.1.2020.04.23.07.41.20
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 23 Apr 2020 07:41:21 -0700 (PDT)
To: Mike Snitzer <snitzer@redhat.com>
References: <20200420134659.1640089-1-dbaryshkov@gmail.com>
	<20200421182754.GA49104@lobo>
	<e3b78a32-4307-c60c-f9c3-dd6d71b6633c@gmail.com>
	<20200422214052.GA10695@redhat.com>
	<67eedf43-7afb-3c2e-704a-d0ac187d6a4b@gmail.com>
	<20200423140612.GA14885@redhat.com>
From: Milan Broz <gmazyland@gmail.com>
Message-ID: <83f9aeb6-9400-1b8a-cb98-263ee1762cea@gmail.com>
Date: Thu, 23 Apr 2020 16:41:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200423140612.GA14885@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>,
	Dmitry Baryshkov <dmitry_baryshkov@mentor.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 23/04/2020 16:06, Mike Snitzer wrote:
> 
> Seems you didn't look at the fixed patch, here is what I ultimately
> staged yesterday:
> https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=dm-5.8&id=a2b35bd064baf1f4e7504c23d493a3e149172dd1
> 
> dm-crypt doesn't have a hard dependency on CONFIG_ENCRYPTED_KEYS.  If it
> is enabled support will be available, if not enabled support isn't.

It is acceptable solution if you really want to push it now.
Just you will repeat the same #ifdef exercise for the "trusted" key type.

What we did last time, is here - it combines dynamic key type loading
and #if IS_REACHABLE(CONFIG_ENCRYPTED_KEYS) (we cannot avoid it if it is completely compiled out here)
It is somewhat more readable for me and eliminates few ifdefs.

Just it can be no longer applied, but the idea is here in two old patches:
  https://mbroz.fedorapeople.org/tmp/

Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

