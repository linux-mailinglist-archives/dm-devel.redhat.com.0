Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9E5932F744B
	for <lists+dm-devel@lfdr.de>; Fri, 15 Jan 2021 09:29:26 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-QNDslc1YNuOCcwxnqm6hIA-1; Fri, 15 Jan 2021 03:29:23 -0500
X-MC-Unique: QNDslc1YNuOCcwxnqm6hIA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C08F1801FD4;
	Fri, 15 Jan 2021 08:29:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3D46E10027A5;
	Fri, 15 Jan 2021 08:29:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ED31A18095C7;
	Fri, 15 Jan 2021 08:29:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10EJLxdU024363 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 14 Jan 2021 14:21:59 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 606D0E77BE; Thu, 14 Jan 2021 19:21:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 59DB1E77BF
	for <dm-devel@redhat.com>; Thu, 14 Jan 2021 19:21:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 72833801231
	for <dm-devel@redhat.com>; Thu, 14 Jan 2021 19:21:56 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-583-c4H4B1FXNd6QB0K3WXMTSw-1;
	Thu, 14 Jan 2021 14:21:52 -0500
X-MC-Unique: c4H4B1FXNd6QB0K3WXMTSw-1
Received: from [192.168.0.104] (c-73-42-176-67.hsd1.wa.comcast.net
	[73.42.176.67])
	by linux.microsoft.com (Postfix) with ESMTPSA id 662FE20B6C40;
	Thu, 14 Jan 2021 11:21:50 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 662FE20B6C40
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
To: Mimi Zohar <zohar@linux.ibm.com>, Paul Moore <paul@paul-moore.com>,
	Sasha Levin <sashal@kernel.org>
References: <20210108040708.8389-1-tusharsu@linux.microsoft.com>
	<20210108040708.8389-9-tusharsu@linux.microsoft.com>
	<CAHC9VhSJk0wG=WzO3bwsueiy19mMi9m6MamTrQfH8C=gXUtvGw@mail.gmail.com>
	<97328fc71687a0e1c327f6821548be9ba35bb193.camel@linux.ibm.com>
	<CAHC9VhTzaQ_q8gJ0oeok_yJ54XLETNvOuhhKnyRwgqsqvpBLCw@mail.gmail.com>
	<71cddb6c8676ccd63c89364d805cfca76d32cb6e.camel@linux.ibm.com>
	<CAHC9VhRhYWEcK7TepZ=LK1m=9Zn_gtOZyAYfamP-TFU3rRH+zw@mail.gmail.com>
	<e29a618645b0e73ec06960a02b6da465614689ff.camel@linux.ibm.com>
	<CAHC9VhTHqwKem=MyQBY4TNAq-DOVhwEZS8pjrSE=4OxdEVm-GA@mail.gmail.com>
	<3746bc7673df25354411151442a7772b867be396.camel@linux.ibm.com>
	<fc80b1a1-ff4d-3bf2-59bd-2cb56135bf0f@linux.microsoft.com>
	<99be76345f375bb2f485f08a53dcb8ed806dc538.camel@linux.ibm.com>
	<f42d49d2e876379c0ef6e31a34027be95ffb1375.camel@linux.ibm.com>
	<e883298b-1027-2a58-dcf8-fc940ebc27ff@linux.microsoft.com>
Message-ID: <507ebab8-828b-8b44-45be-2dbff3406b72@linux.microsoft.com>
Date: Thu, 14 Jan 2021 11:21:46 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e883298b-1027-2a58-dcf8-fc940ebc27ff@linux.microsoft.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 10EJLxdU024363
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 15 Jan 2021 03:28:57 -0500
Cc: dm-devel@redhat.com, snitzer@redhat.com, selinux@vger.kernel.org,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	James Morris <jmorris@namei.org>, linux-kernel@vger.kernel.org,
	casey@schaufler-ca.com, linux-security-module@vger.kernel.org,
	tyhicks@linux.microsoft.com,
	Tushar Sugandhi <tusharsu@linux.microsoft.com>,
	linux-integrity@vger.kernel.org, gmazyland@gmail.com, agk@redhat.com
Subject: Re: [dm-devel] [PATCH v10 8/8] selinux: include a consumer of the
 new IMA critical data hook
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-15"; Format="flowed"

On 1/14/21 9:48 AM, Lakshmi Ramasubramanian wrote:
> On 1/14/21 8:50 AM, Mimi Zohar wrote:
>> On Thu, 2021-01-14 at 11:44 -0500, Mimi Zohar wrote:
>>> [Cc'ing Sasha]
>>>
>>> Hi Lakshmi,
>>>
>>> On Thu, 2021-01-14 at 08:22 -0800, Lakshmi Ramasubramanian wrote:
>>>> On 1/13/21 6:49 PM, Mimi Zohar wrote:
>>>
>>>>>>> Lakshmi is trying to address the situation where an event changes a
>>>>>>> value, but then is restored to the original value.=A0 The original =
and
>>>>>>> subsequent events are measured, but restoring to the original value
>>>>>>> isn't re-measured.=A0 This isn't any different than when a file is
>>>>>>> modified and then reverted.
>>>>>>>
>>>>>>> Instead of changing the name like this, which doesn't work for=20
>>>>>>> files,
>>>>>>> allowing duplicate measurements should be generic, based on policy.
>>>>>>
>>>>>> Perhaps it is just the end of the day and I'm a bit tired, but I jus=
t
>>>>>> read all of the above and I have no idea what your current thoughts
>>>>>> are regarding this patch.
>>>>>
>>>>> Other than appending the timestamp, which is a hack, the patch is=20
>>>>> fine.
>>>>> Support for re-measuring an event can be upstreamed independently.
>>>>>
>>>>
>>>> Thanks for clarifying the details related to duplicate measurement
>>>> detection and re-measuring.
>>>>
>>>> I will keep the timestamp for the time being, even though its a=20
>>>> hack, as
>>>> it helps with re-measuring state changes in SELinux. We will add=20
>>>> support
>>>> for "policy driven" re-measurement as a subsequent patch series.
>>>
>>> Once including the timestamp is upstreamed, removing it will be
>>> difficult, especially if different userspace applications are dependent
>>> on it.=A0 Unless everyone is on board that removing the timestamp
>>> wouldn't be considered a regression, it cannot be upstreamed.
>>
>> Feel free to just re-post just this one patch.=A0 Otherwise the patch se=
t
>> looks good.
>>
>> thanks,
>>
>=20
> Sounds good Mimi - I will remove the timestamp and re-post the selinux=20
> patch.
>=20

I have removed the timestamp in the event name and have posted the=20
selinux patch alone.

Thanks a lot for reviewing the changes.

  -lakshmi



--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

