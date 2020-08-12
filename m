Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 64BFB242DD8
	for <lists+dm-devel@lfdr.de>; Wed, 12 Aug 2020 19:07:51 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-7UyvrUZuODSHEladjNDAmQ-1; Wed, 12 Aug 2020 13:07:47 -0400
X-MC-Unique: 7UyvrUZuODSHEladjNDAmQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B4221005504;
	Wed, 12 Aug 2020 17:07:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F2CD31C4;
	Wed, 12 Aug 2020 17:07:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CC2EF9A022;
	Wed, 12 Aug 2020 17:07:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07CH7MTL012870 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 12 Aug 2020 13:07:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 01D4A11921A5; Wed, 12 Aug 2020 17:07:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF0D411921A8
	for <dm-devel@redhat.com>; Wed, 12 Aug 2020 17:07:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7A70A85A5B8
	for <dm-devel@redhat.com>; Wed, 12 Aug 2020 17:07:17 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-233-CVlBmbc3N46r9TQKnmJMvQ-1;
	Wed, 12 Aug 2020 13:07:14 -0400
X-MC-Unique: CVlBmbc3N46r9TQKnmJMvQ-1
Received: from [10.137.106.139] (unknown [131.107.174.11])
	by linux.microsoft.com (Postfix) with ESMTPSA id E097C20B4908;
	Wed, 12 Aug 2020 10:07:04 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E097C20B4908
To: Chuck Lever <chucklever@gmail.com>, James Morris <jmorris@namei.org>
References: <20200728213614.586312-1-deven.desai@linux.microsoft.com>
	<20200802115545.GA1162@bug> <20200802140300.GA2975990@sasha-vm>
	<20200802143143.GB20261@amd>
	<1596386606.4087.20.camel@HansenPartnership.com>
	<fb35a1f7-7633-a678-3f0f-17cf83032d2b@linux.microsoft.com>
	<1596639689.3457.17.camel@HansenPartnership.com>
	<alpine.LRH.2.21.2008050934060.28225@namei.org>
	<b08ae82102f35936427bf138085484f75532cff1.camel@linux.ibm.com>
	<329E8DBA-049E-4959-AFD4-9D118DEB176E@gmail.com>
	<alpine.LRH.2.21.2008120643370.10591@namei.org>
	<70603A4E-A548-4ECB-97D4-D3102CE77701@gmail.com>
From: Deven Bowers <deven.desai@linux.microsoft.com>
Message-ID: <5edd58e3-7f12-10af-ef1c-4c1b32cf99e4@linux.microsoft.com>
Date: Wed, 12 Aug 2020 10:07:04 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <70603A4E-A548-4ECB-97D4-D3102CE77701@gmail.com>
Content-Language: en-US
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: snitzer@redhat.com, Mimi Zohar <zohar@linux.ibm.com>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	dm-devel@redhat.com, tyhicks@linux.microsoft.com,
	Pavel Machek <pavel@ucw.cz>, agk@redhat.com,
	Sasha Levin <sashal@kernel.org>, Paul Moore <paul@paul-moore.com>,
	Jonathan Corbet <corbet@lwn.net>, nramas@linux.microsoft.com,
	serge@hallyn.com, pasha.tatashin@soleen.com,
	Jann Horn <jannh@google.com>, linux-block@vger.kernel.org,
	Al Viro <viro@zeniv.linux.org.uk>, Jens Axboe <axboe@kernel.dk>,
	mdsakib@microsoft.com, open list <linux-kernel@vger.kernel.org>,
	eparis@redhat.com, linux-security-module@vger.kernel.org,
	linux-audit@redhat.com, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	linux-integrity@vger.kernel.org, jaskarankhurana@linux.microsoft.com
Subject: Re: [dm-devel] [RFC PATCH v5 00/11] Integrity Policy Enforcement
 LSM (IPE)
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit



On 8/12/2020 7:18 AM, Chuck Lever wrote:
> 
> 
>> On Aug 11, 2020, at 5:03 PM, James Morris <jmorris@namei.org> wrote:
>>
>> On Sat, 8 Aug 2020, Chuck Lever wrote:
>>
>>> My interest is in code integrity enforcement for executables stored
>>> in NFS files.
>>>
>>> My struggle with IPE is that due to its dependence on dm-verity, it
>>> does not seem to able to protect content that is stored separately
>>> from its execution environment and accessed via a file access
>>> protocol (FUSE, SMB, NFS, etc).
>>
>> It's not dependent on DM-Verity, that's just one possible integrity
>> verification mechanism, and one of two supported in this initial
>> version. The other is 'boot_verified' for a verified or otherwise trusted
>> rootfs. Future versions will support FS-Verity, at least.
>>
>> IPE was designed to be extensible in this way, with a strong separation of
>> mechanism and policy.
> 
> I got that, but it looked to me like the whole system relied on having
> access to the block device under the filesystem. That's not possible
> for a remote filesystem like Ceph or NFS.

Block device structure no, (though that's what the currently used, to be
fair). It really has a hard dependency on the file structure,
specifically the ability to determine whether that file structure can be 
used to navigate back to the integrity claim provided by the mechanism.

In the current world of IPE, the integrity claim is the root-hash or 
root-hash-signature on the block device, provided by dm-verity's 
setsecurity hooks (also introduced in this series).

> 
> I'm happy to take a closer look if someone can point me the right way.
> 

Sure, if you look at the 2nd patch, you want to look at the file 
"security/ipe/ipe-property.h", it defines what methods are required to
be implemented by a mechanism to work with IPE. It passes the engine
context which is defined as:

  struct ipe_engine_ctx {
  	enum ipe_op op;
  	enum ipe_hook hook;
  	const struct file *file;
  	const char *audit_pathname;
	const struct ipe_bdev_blob *sec_bdev;
  };

Now, if the security blob existed for the block_device, it would be
in sec_bdev, but that may be NULL, as well to be fair.

If you want a more worked example of how integration works, patches 8
and 10 introduce the dm-verity properties mentioned in this patch.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

