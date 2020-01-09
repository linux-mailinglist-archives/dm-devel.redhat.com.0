Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4BF9F1351DD
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jan 2020 04:19:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578539979;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post:autocrypt:autocrypt;
	bh=y5/o7utb7oawPxuS5qy5+hJ/NRufCpGZY9j+8+4uDeY=;
	b=OPaHYQkLjXCfvB5RWPTy2KRuTdIvp3HSJjwu/jIksyce7KTS6i4aIPMrTycqT8PbEzOMt4
	x257Ca2npEt6/0ZCAVdUAhYdT14MktomX1pWylPJ353/8eH0ee7laodPLxkkgcnhikRY3/
	baYHTwbhM6EveuM5422RSwytowbDUyA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-wIcwYqO-P6WNa3ajO96D9A-1; Wed, 08 Jan 2020 22:19:37 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B88C800D48;
	Thu,  9 Jan 2020 03:19:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ADDD71A8E9;
	Thu,  9 Jan 2020 03:19:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9DAE51809567;
	Thu,  9 Jan 2020 03:19:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0093J4Sd027590 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 8 Jan 2020 22:19:04 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8620A2022EA7; Thu,  9 Jan 2020 03:19:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 808092026D67
	for <dm-devel@redhat.com>; Thu,  9 Jan 2020 03:19:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5639F8028B8
	for <dm-devel@redhat.com>; Thu,  9 Jan 2020 03:19:02 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-257-AkYh0wjfOA2096JBSuQNoQ-1; Wed, 08 Jan 2020 22:18:58 -0500
Received: by mail-pf1-f195.google.com with SMTP id q8so2633299pfh.7;
	Wed, 08 Jan 2020 19:18:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=xvwJUZHq6lxJoKDxCisGtxxmXtMnuv/UNfH5O07lFZo=;
	b=EoK+2IcwECyJ6xEKYSsptYtGolnvMOiuU6xtgg6xzUaQ6AZ6skIVYdL84Wk7NuGZ7c
	N8qVUPaa++a7fp6Q9BT6QYrbHu90xjb2VfWVTVBjojPvCv1Prt0r+x5lRbmy0OqaEH05
	4smOBke12qoLLXyyrhlDYd3GClK0GMqAdL9bBMSU2u7HQjwZAdrdXbvPkOIB3LUWuo9H
	fdDIlc0MzZMlf2RuqKcbpcmIPm0ifKJaPhcrS6NI1SnQecnyJtJNLBQn2ShKWG984WAr
	qQnEP+6XHGQYnLK4mEaJNEkjlKzlsavjM5eblLteUH3r2bL6m68HoSZ3DGIHY5RUKgJU
	KRFQ==
X-Gm-Message-State: APjAAAXzbq62SP/8Ll4q1UeQz3AEwTQOZLQ/tcZWAaKJJY+EMTConbA9
	JXWJXDHxdSWmn2oyiGDpklE=
X-Google-Smtp-Source: APXvYqyGcYW8QghgpwpHDZvledwi63ygsODu3fJ9j6dW7GYv2QsLTnEXqFY8v4xdUd00X1/vgofBjA==
X-Received: by 2002:a63:ea4b:: with SMTP id l11mr8663718pgk.357.1578539936882; 
	Wed, 08 Jan 2020 19:18:56 -0800 (PST)
Received: from ?IPv6:2601:647:4000:13e0:f4e4:e61b:5262:7ebf?
	([2601:647:4000:13e0:f4e4:e61b:5262:7ebf])
	by smtp.gmail.com with ESMTPSA id
	h126sm5594082pfe.19.2020.01.08.19.18.55
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 08 Jan 2020 19:18:55 -0800 (PST)
To: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"lsf-pc@lists.linux-foundation.org" <lsf-pc@lists.linux-foundation.org>
References: <BYAPR04MB5749820C322B40C7DBBBCA02863F0@BYAPR04MB5749.namprd04.prod.outlook.com>
From: Bart Van Assche <bvanassche@acm.org>
Autocrypt: addr=bvanassche@acm.org; prefer-encrypt=mutual; keydata=
	mQENBFSOu4oBCADcRWxVUvkkvRmmwTwIjIJvZOu6wNm+dz5AF4z0FHW2KNZL3oheO3P8UZWr
	LQOrCfRcK8e/sIs2Y2D3Lg/SL7qqbMehGEYcJptu6mKkywBfoYbtBkVoJ/jQsi2H0vBiiCOy
	fmxMHIPcYxaJdXxrOG2UO4B60Y/BzE6OrPDT44w4cZA9DH5xialliWU447Bts8TJNa3lZKS1
	AvW1ZklbvJfAJJAwzDih35LxU2fcWbmhPa7EO2DCv/LM1B10GBB/oQB5kvlq4aA2PSIWkqz4
	3SI5kCPSsygD6wKnbRsvNn2mIACva6VHdm62A7xel5dJRfpQjXj2snd1F/YNoNc66UUTABEB
	AAG0JEJhcnQgVmFuIEFzc2NoZSA8YnZhbmFzc2NoZUBhY20ub3JnPokBOQQTAQIAIwUCVI67
	igIbAwcLCQgHAwIBBhUIAgkKCwQWAgMBAh4BAheAAAoJEHFcPTXFzhAJ8QkH/1AdXblKL65M
	Y1Zk1bYKnkAb4a98LxCPm/pJBilvci6boefwlBDZ2NZuuYWYgyrehMB5H+q+Kq4P0IBbTqTa
	jTPAANn62A6jwJ0FnCn6YaM9TZQjM1F7LoDX3v+oAkaoXuq0dQ4hnxQNu792bi6QyVdZUvKc
	macVFVgfK9n04mL7RzjO3f+X4midKt/s+G+IPr4DGlrq+WH27eDbpUR3aYRk8EgbgGKvQFdD
	CEBFJi+5ZKOArmJVBSk21RHDpqyz6Vit3rjep7c1SN8s7NhVi9cjkKmMDM7KYhXkWc10lKx2
	RTkFI30rkDm4U+JpdAd2+tP3tjGf9AyGGinpzE2XY1K5AQ0EVI67igEIAKiSyd0nECrgz+H5
	PcFDGYQpGDMTl8MOPCKw/F3diXPuj2eql4xSbAdbUCJzk2ETif5s3twT2ER8cUTEVOaCEUY3
	eOiaFgQ+nGLx4BXqqGewikPJCe+UBjFnH1m2/IFn4T9jPZkV8xlkKmDUqMK5EV9n3eQLkn5g
	lco+FepTtmbkSCCjd91EfThVbNYpVQ5ZjdBCXN66CKyJDMJ85HVr5rmXG/nqriTh6cv1l1Js
	T7AFvvPjUPknS6d+BETMhTkbGzoyS+sywEsQAgA+BMCxBH4LvUmHYhpS+W6CiZ3ZMxjO8Hgc
	++w1mLeRUvda3i4/U8wDT3SWuHcB3DWlcppECLkAEQEAAYkBHwQYAQIACQUCVI67igIbDAAK
	CRBxXD01xc4QCZ4dB/0QrnEasxjM0PGeXK5hcZMT9Eo998alUfn5XU0RQDYdwp6/kMEXMdmT
	oH0F0xB3SQ8WVSXA9rrc4EBvZruWQ+5/zjVrhhfUAx12CzL4oQ9Ro2k45daYaonKTANYG22y
	//x8dLe2Fv1By4SKGhmzwH87uXxbTJAUxiWIi1np0z3/RDnoVyfmfbbL1DY7zf2hYXLLzsJR
	mSsED/1nlJ9Oq5fALdNEPgDyPUerqHxcmIub+pF0AzJoYHK5punqpqfGmqPbjxrJLPJfHVKy
	goMj5DlBMoYqEgpbwdUYkH6QdizJJCur4icy8GUNbisFYABeoJ91pnD4IGei3MTdvINSZI5e
Message-ID: <fda88fd3-2d75-085e-ca15-a29f89c1e781@acm.org>
Date: Wed, 8 Jan 2020 19:18:54 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <BYAPR04MB5749820C322B40C7DBBBCA02863F0@BYAPR04MB5749.namprd04.prod.outlook.com>
Content-Language: en-US
X-MC-Unique: AkYh0wjfOA2096JBSuQNoQ-1
X-MC-Unique: wIcwYqO-P6WNa3ajO96D9A-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0093J4Sd027590
X-loop: dm-devel@redhat.com
Cc: "axboe@kernel.dk" <axboe@kernel.dk>,
	"msnitzer@redhat.com" <msnitzer@redhat.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Matias Bjorling <Matias.Bjorling@wdc.com>,
	Stephen Bates <sbates@raithlin.com>,
	"roland@purestorage.com" <roland@purestorage.com>,
	"mpatocka@redhat.com" <mpatocka@redhat.com>,
	Keith Busch <kbusch@kernel.org>,
	"rwheeler@redhat.com" <rwheeler@redhat.com>,
	Christoph Hellwig <hch@lst.de>,
	"frederick.knight@netapp.com" <frederick.knight@netapp.com>,
	"zach.brown@ni.com" <zach.brown@ni.com>
Subject: Re: [dm-devel] [LSF/MM/BFP ATTEND] [LSF/MM/BFP TOPIC] Storage: Copy
	Offload
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020-01-07 10:14, Chaitanya Kulkarni wrote:
> * Current state of the work :-
> -----------------------------------------------------------------------
> 
> With [3] being hard to handle arbitrary DM/MD stacking without
> splitting the command in two, one for copying IN and one for copying
> OUT. Which is then demonstrated by the [4] why [3] it is not a suitable
> candidate. Also, with [4] there is an unresolved problem with the
> two-command approach about how to handle changes to the DM layout
> between an IN and OUT operations.

Was this last discussed during the 2018 edition of LSF/MM (see also
https://www.spinics.net/lists/linux-block/msg24986.html)? Has anyone
taken notes during that session? I haven't found a report of that
session in the official proceedings (https://lwn.net/Articles/752509/).

Thanks,

Bart.


This is my own collection with two year old notes about copy offloading
for the Linux Kernel:

Potential Users
* All dm-kcopyd users, e.g. dm-cache-target, dm-raid1, dm-snap, dm-thin,
  dm-writecache and dm-zoned.
* Local filesystems like BTRFS, f2fs and bcachefs: garbage collection
  and RAID, at least if RAID is supported by the filesystem. Note: the
  BTRFS_IOC_CLONE_RANGE ioctl is no longer supported. Applications
  should use FICLONERANGE instead.
* Network filesystems, e.g. NFS. Copying at the server side can reduce
  network traffic significantly.
* Linux SCSI initiator systems connected to SAN systems such that
  copying can happen locally on the storage array. XCOPY is widely used
  for provisioning virtual machine images.
* Copy offloading in NVMe fabrics using PCIe peer-to-peer communication.

Requirements
* The block layer must gain support for XCOPY. The new XCOPY API must
  support asynchronous operation such that users of this API are not
  blocked while the XCOPY operation is in progress.
* Copying must be supported not only within a single storage device but
  also between storage devices.
* The SCSI sd driver must gain support for XCOPY.
* A user space API must be added and that API must support asynchronous
  (non-blocking) operation.
* The block layer XCOPY primitive must be support by the device mapper.

SCSI Extended Copy (ANSI T10 SPC)
The SCSI commands that support extended copy operations are:
* POPULATE TOKEN + WRITE USING TOKEN.
* EXTENDED COPY(LID1/4) + RECEIVE COPY STATUS(LID1/4). LID1 stands for a
  List Identifier length of 1 byte and LID4 stands for a List Identifier
  length of 4 bytes.
* SPC-3 and before define EXTENDED COPY(LID1) (83h/00h). SPC-4 added
  EXTENDED COPY(LID4) (83h/01h).

Existing Users and Implementations of SCSI XCOPY
* VMware, which uses XCOPY (with a one-byte length ID, aka LID1).
* Microsoft, which uses ODX (aka LID4 because it has a four-byte length
  ID).
* Storage vendors all support XCOPY, but ODX support is growing.

Block Layer Notes
The block layer supports the following types of block drivers:
* blk-mq request-based drivers.
* make_request drivers.

Notes:
With each request a list of bio's is associated.
Since submit_bio() only accepts a single bio and not a bio list this
means that all make_request block drivers process one bio at a time.

Device Mapper
The device mapper core supports bio processing and blk-mq requests. The
function in the device mapper that creates a request queue is called
alloc_dev(). That function not only allocates a request queue but also
associates a struct gendisk with the request queue. The
DM_DEV_CREATE_CMD ioctl triggers a call of alloc_dev(). The
DM_TABLE_LOAD ioctl loads a table definition. Loading a table definition
causes the type of a dm device to be set to one of the following:
DM_TYPE_NONE;
DM_TYPE_BIO_BASED;
DM_TYPE_REQUEST_BASED;
DM_TYPE_MQ_REQUEST_BASED;
DM_TYPE_DAX_BIO_BASED;
DM_TYPE_NVME_BIO_BASED.

Device mapper drivers must implement target_type.map(),
target_type.clone_and_map_rq() or both. .map() maps a bio list.
.clone_and_map_rq() maps a single request. The multipath and error
device mapper drivers implement both methods. All other dm drivers only
implement the .map() method.

Device mapper bio processing
submit_bio()
-> generic_make_request()
  -> dm_make_request()
    -> __dm_make_request()
      -> __split_and_process_bio()
        -> __split_and_process_non_flush()
          -> __clone_and_map_data_bio()
          -> alloc_tio()
          -> clone_bio()
            -> bio_advance()
          -> __map_bio()

Existing Linux Copy Offload APIs
* The FICLONERANGE ioctl. From <include/linux/fs.h>:
  #define FICLONERANGE _IOW(0x94, 13, struct file_clone_range)

struct file_clone_range {
	__s64 src_fd;
	__u64 src_offset;
	__u64 src_length;
	__u64 dest_offset;
};

* The sendfile() system call. sendfile() copies a given number of bytes
  from one file to another. The output offset is the offset of the
  output file descriptor. The input offset is either the input file
  descriptor offset or can be specified explicitly. The sendfile()
  prototype is as follows:
  ssize_t sendfile(int out_fd, int in_fd, off_t *ppos, size_t count);
  ssize_t sendfile64(int out_fd, int in_fd, loff_t *ppos, size_t count);
* The copy_file_range() system call. See also vfs_copy_file_range(). Its
  prototype is as follows:
  ssize_t copy_file_range(int fd_in, loff_t *off_in, int fd_out,
     loff_t *off_out, size_t len, unsigned int flags);
* The splice() system call is not appropriate for adding extended copy
  functionality since it copies data from or to a pipe. Its prototype is
  as follows:
  long splice(struct file *in, loff_t *off_in, struct file *out,
    loff_t *off_out, size_t len, unsigned int flags);

Existing Linux Block Layer Copy Offload Implementations
* Martin Petersen's REQ_COPY bio, where source and destination block
  device are both specified in the same bio. Only works for block
  devices. Does not work for files. Adds a new blocking ioctl() for
  XCOPY from user space.
* Mikulas Patocka's approach: separate REQ_OP_COPY_WRITE and
  REQ_OP_COPY_READ operations. These are sent individually down stacked
  drivers and are paired by the driver at the bottom of the stack.


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

