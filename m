Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 329852902AB
	for <lists+dm-devel@lfdr.de>; Fri, 16 Oct 2020 12:19:47 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-KUjxvbZwNp-BHfA2wNha0w-1; Fri, 16 Oct 2020 06:19:43 -0400
X-MC-Unique: KUjxvbZwNp-BHfA2wNha0w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7F93186841A;
	Fri, 16 Oct 2020 10:19:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D248C5578B;
	Fri, 16 Oct 2020 10:19:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 54BFC44A60;
	Fri, 16 Oct 2020 10:19:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09G8Torp003493 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 16 Oct 2020 04:29:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 88CA92157F23; Fri, 16 Oct 2020 08:29:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 820DD2166B28
	for <dm-devel@redhat.com>; Fri, 16 Oct 2020 08:29:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 48DA2800969
	for <dm-devel@redhat.com>; Fri, 16 Oct 2020 08:29:48 +0000 (UTC)
Received: from smtp-8fae.mail.infomaniak.ch (smtp-8fae.mail.infomaniak.ch
	[83.166.143.174]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-443-GG__08dEMXyFbZgG_gcEVw-1; Fri, 16 Oct 2020 04:29:46 -0400
X-MC-Unique: GG__08dEMXyFbZgG_gcEVw-1
Received: from smtp-2-0000.mail.infomaniak.ch (unknown [10.5.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id
	4CCK881ZphzlhX5w; Fri, 16 Oct 2020 10:29:44 +0200 (CEST)
Received: from ns3096276.ip-94-23-54.eu (unknown [94.23.54.103])
	by smtp-2-0000.mail.infomaniak.ch (Postfix) with ESMTPA id
	4CCK864nJFzlh8T9; Fri, 16 Oct 2020 10:29:42 +0200 (CEST)
To: Mike Snitzer <snitzer@redhat.com>
References: <20201015150504.1319098-1-mic@digikod.net>
	<20201015165229.GA5513@redhat.com>
From: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
Message-ID: <022e949e-00c4-d98a-b536-1c5f9e05c09c@digikod.net>
Date: Fri, 16 Oct 2020 10:29:42 +0200
User-Agent: 
MIME-Version: 1.0
In-Reply-To: <20201015165229.GA5513@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 09G8Torp003493
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 16 Oct 2020 06:18:44 -0400
Cc: Deven Bowers <deven.desai@linux.microsoft.com>,
	linux-kernel@vger.kernel.org,
	Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
	=?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@linux.microsoft.com>,
	dm-devel@redhat.com, linux-integrity@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Milan Broz <gmazyland@gmail.com>, Alasdair Kergon <agk@redhat.com>,
	Jaskaran Khurana <jaskarankhurana@linux.microsoft.com>
Subject: Re: [dm-devel] [PATCH v2] dm verity: Add support for signature
 verification with 2nd keyring
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable


On 15/10/2020 18:52, Mike Snitzer wrote:
> On Thu, Oct 15 2020 at 11:05am -0400,
> Micka=EBl Sala=FCn <mic@digikod.net> wrote:
>=20
>> From: Micka=EBl Sala=FCn <mic@linux.microsoft.com>
>>
>> Add a new configuration DM_VERITY_VERIFY_ROOTHASH_SIG_SECONDARY_KEYRING
>> to enable dm-verity signatures to be verified against the secondary
>> trusted keyring.  Instead of relying on the builtin trusted keyring
>> (with hard-coded certificates), the second trusted keyring can include
>> certificate authorities from the builtin trusted keyring and child
>> certificates loaded at run time.  Using the secondary trusted keyring
>> enables to use dm-verity disks (e.g. loop devices) signed by keys which
>> did not exist at kernel build time, leveraging the certificate chain of
>> trust model.  In practice, this makes it possible to update certificates
>> without kernel update and reboot, aligning with module and kernel
>> (kexec) signature verification which already use the secondary trusted
>> keyring.
>>
>> Cc: Alasdair Kergon <agk@redhat.com>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
>> Cc: Jaskaran Khurana <jaskarankhurana@linux.microsoft.com>
>> Cc: Mike Snitzer <snitzer@redhat.com>
>> Cc: Milan Broz <gmazyland@gmail.com>
>> Signed-off-by: Micka=EBl Sala=FCn <mic@linux.microsoft.com>
>> ---
>>
>> Previous version:
>> https://lore.kernel.org/lkml/20201002071802.535023-1-mic@digikod.net/
>>
>> Changes since v1:
>> * Extend the commit message (asked by Jarkko Sakkinen).
>> * Rename the Kconfig "help" keyword according to commit 84af7a6194e4
>>   ("checkpatch: kconfig: prefer 'help' over '---help---'").
>=20
> Can you please explain why you've decided to make this a Kconfig CONFIG
> knob?  Why not either add: a dm-verity table argument? A dm-verity
> kernel module parameter? or both (to allow a particular default but then
> per-device override)?

The purpose of signed dm-verity images is to authenticate files, or said
in another way, to enable the kernel to trust disk images in a flexible
way (i.e. thanks to certificate's chain of trust). Being able to update
such chain at run time requires to use the second trusted keyring. This
keyring automatically includes the certificate authorities from the
builtin trusted keyring, which are required to dynamically populate the
secondary trusted keyring with certificates signed by an already trusted
authority. The roots of trust must then be included at build time in the
builtin trusted keyring.

To be meaningful, using dm-verity signatures implies to have a
restricted user space, i.e. even the root user has limited power over
the kernel and the rest of the system. Blindly trusting data provided by
user space (e.g. dm-verity table argument, kernel module parameter)
defeat the purpose of (mandatory) authenticated images.

>=20
> Otherwise, _all_ DM verity devices will be configured to use secondary
> keyring fallback.  Is that really desirable?

That is already the current state (on purpose).

>=20
> Regardless, I really don't see why a Kconfig knob is appropriate.

Moreover, a Kconfig knob makes sense as much as
DM_VERITY_VERIFY_ROOTHASH_SIG,
IMA_KEYRINGS_PERMIT_SIGNED_BY_BUILTIN_OR_SECONDARY, MODULE_SIG_FORCE and
other similar authentication mechanisms. Indeed, when using these
configurations, we want the kernel to enforce a specific policy.

Obviously, we can't make the DM_VERITY_VERIFY_ROOTHASH_SIG relies on the
secondary trusted keyring without important security implications for
systems already using this configuration (and then the builtin trusted
keyring as the unique source of trust).


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

