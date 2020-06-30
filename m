Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 7A88B20F02B
	for <lists+dm-devel@lfdr.de>; Tue, 30 Jun 2020 10:08:16 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-8veK0Qe-MB-yua1YJMFRbA-1; Tue, 30 Jun 2020 04:08:12 -0400
X-MC-Unique: 8veK0Qe-MB-yua1YJMFRbA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3A1D10CE780;
	Tue, 30 Jun 2020 08:08:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B54CE7BEBB;
	Tue, 30 Jun 2020 08:07:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AAF0B6C9C2;
	Tue, 30 Jun 2020 08:07:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05U8741g014910 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 30 Jun 2020 04:07:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 10F5A202A97C; Tue, 30 Jun 2020 08:07:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 047F7201EFEB
	for <dm-devel@redhat.com>; Tue, 30 Jun 2020 08:06:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CD834800260
	for <dm-devel@redhat.com>; Tue, 30 Jun 2020 08:06:59 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-459-dmM1ASRSP0yOipN2molUdA-1; Tue, 30 Jun 2020 04:06:49 -0400
X-MC-Unique: dmM1ASRSP0yOipN2molUdA-1
IronPort-SDR: ao2RPBsFKweQktFLobT+LM+hV5vrRPmI4WDQMhP+XHc+BOlTDNPaKSlFha2KgGP3nShB6zlk5d
	wlqUKa3atTuw==
X-IronPort-AV: E=McAfee;i="6000,8403,9666"; a="211238573"
X-IronPort-AV: E=Sophos;i="5.75,296,1589266800"; d="scan'208";a="211238573"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	30 Jun 2020 01:05:45 -0700
IronPort-SDR: x7BusaNoYWwxnjt7bHP6Qm5vRrgyHHRO6tUyiBKOtMm3ilMQII6o9gMVamWRYGgGhT+r8UeHvd
	go7sRFDpv+QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,296,1589266800"; d="scan'208";a="320862775"
Received: from apaszkie-desk.igk.intel.com ([10.102.102.225])
	by FMSMGA003.fm.intel.com with ESMTP; 30 Jun 2020 01:05:44 -0700
To: Bart Van Assche <bvanassche@acm.org>, dm-devel@redhat.com
References: <fb4877be-4d88-2816-9000-dcc540e8c093@intel.com>
	<f4e57ef4-e0df-d2e6-a00a-074a08f10dbb@acm.org>
From: Artur Paszkiewicz <artur.paszkiewicz@intel.com>
Message-ID: <9fa466c0-d99e-338d-c93c-68aac372217c@intel.com>
Date: Tue, 30 Jun 2020 10:05:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <f4e57ef4-e0df-d2e6-a00a-074a08f10dbb@acm.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] dm-crypt hard lockup
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 6/28/20 6:50 PM, Bart Van Assche wrote:
> Since considerable time I'm doing kernel builds (make -j8) on an
> openSUSE Tumbleweed system on top of dm-crypt and an NVMe SSD but I have
> not yet encountered any kind of lockup. Maybe another driver, e.g. an
> I/O scheduler, is responsible for the lockups?

It could by another driver. I tried with a different filesystem (xfs),
without any I/O scheduler and even with the sources on a different drive
without dm-crypt, and the results were more or less the same - lockups
involving dm-crypt. Maybe I'm just abusing the system - I'm actually
running "make -j", so the number of tasks is unlimited. With a limited
number it does not hang. I know it's not a good idea to do this but it
used to work, and I think it shouldn't cause the kernel to die like
this.

Artur

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

